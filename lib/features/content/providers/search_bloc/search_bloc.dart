import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/configs/constants.dart';
import 'package:wayo/features/content/models/result.dart';
import 'package:wayo/features/content/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchForItem>(_onSearchForItem);
  }

  final _searchRepo = SearchRepository();

  void _onSearchForItem(
    SearchForItem event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      emit(state.copyWith(
        status: LoadingStatus.success,
        results: await _searchRepo.searchForItem(event.query),
      ));
    } catch (e) {
      log('$e');
      emit(state.copyWith(
        status: LoadingStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
