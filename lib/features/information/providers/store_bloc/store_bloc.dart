import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/store.dart';
import '../../repositories/store_repository.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitial()) {
    on<GetStores>(_onGetStores);
    on<SetSelectedStore>(_onSetSelectedStore);
  }

  final _storeRepo = StoreRepository();

  void _onGetStores(
    GetStores event,
    Emitter<StoreState> emit,
  ) async {
    emit(StoreLoading());
    try {
      emit(StoreFetched(stores: await _storeRepo.getStores()));
    } catch (e) {
      log(e.toString());
      emit(StoreError(errorMessage: e.toString()));
    }
  }

  void _onSetSelectedStore(
    SetSelectedStore event,
    Emitter<StoreState> emit,
  ) async {
    emit(StoreLoading());
    try {
      emit(StoreSelected(store: event.store));
    } catch (e) {
      emit(StoreError(errorMessage: e.toString()));
    }
  }
}
