import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/configs/constants.dart';
import 'package:wayo/features/content/repositories/search_repository.dart';

import '../../models/branch.dart';
import '../../models/mall.dart';
import '../../models/store.dart';

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
      final List<Mall> malls = [];
      final List<Store> stores = [];
      final List<Branch> branches = [];

      if (event.query.isNotEmpty) {
        final results = await _searchRepo.searchForItem(event.query);

        for (var element in results) {
          try {
            malls.add(Mall.fromJson(element.document));
          } catch (e) {
            log('$e');
          }
          try {
            stores.add(Store.fromJson(element.document));
          } catch (e) {
            log('$e');
          }
          try {
            branches.add(Branch.fromJson(element.document));
          } catch (e) {
            log('$e');
          }
        }
      }

      emit(
        SearchState(
          status: LoadingStatus.success,
          malls: malls,
          stores: stores,
          branches: branches,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: LoadingStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
