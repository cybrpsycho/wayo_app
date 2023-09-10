import "dart:developer";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/config/dev_functions.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/result.dart";
import "package:wayo/repositories/search_repository.dart";

part "search_event.dart";
part "search_state.dart";

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchForItem>(_onSearchForItem);
  }

  final _searchRepo = SearchRepository();

  void _onSearchForItem(
    SearchForItem event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      if (event.query.isNotEmpty) {
        final results = await _searchRepo.searchForItem(event.query);
        await simulateLatency();
        emit(
          SearchState(
            status: BlocStatus.success,
            results: results,
          ),
        );
      }
    } catch (e) {
      log("$e");
      emit(state.copyWith(
        status: BlocStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
