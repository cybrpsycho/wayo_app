import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/store.dart';
import '../../../../repositories/store_repository.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitial()) {
    on<GetStores>(_onGetStores);
    on<GetStoresInMall>(_onGetStoresInMall);
    on<GetStore>(_onGetStore);
  }

  final _storeRepo = StoreRepository();

  void _onGetStores(
    GetStores event,
    Emitter<StoreState> emit,
  ) async {
    emit(StoreLoading());
    try {
      emit(StoresFetched(stores: await _storeRepo.getStores()));
    } catch (e) {
      log(e.toString());
      emit(StoreError(errorMessage: e.toString()));
    }
  }

  void _onGetStoresInMall(
    GetStoresInMall event,
    Emitter<StoreState> emit,
  ) async {
    emit(StoreLoading());
    try {
      emit(StoresFetched(stores: await _storeRepo.getStores()));
    } catch (e) {
      log(e.toString());
      emit(StoreError(errorMessage: e.toString()));
    }
  }

  void _onGetStore(
    GetStore event,
    Emitter<StoreState> emit,
  ) async {
    emit(StoreLoading());
    try {
      final store = await _storeRepo.getStore(event.storeId);
      if (store != null) {
        emit(StoreFetched(store: store));
      }
    } catch (e) {
      log(e.toString());
      emit(StoreError(errorMessage: e.toString()));
    }
  }
}
