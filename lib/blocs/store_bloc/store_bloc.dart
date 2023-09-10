import "dart:developer";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/config/dev_functions.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/store.dart";
import "package:wayo/models/branch.dart";
import "package:wayo/repositories/store_repository.dart";

part "store_event.dart";
part "store_state.dart";

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(const StoreState()) {
    on<GetStores>(_onGetStores);
    on<GetBranches>(_onGetBranches);
    on<GetStore>(_onGetStore);
    on<GetBranch>(_onGetBranch);
  }

  final _storeRepo = StoreRepository();

  void _onGetStores(
    GetStores event,
    Emitter<StoreState> emit,
  ) async {
    emit(const StoreState(status: BlocStatus.loading));
    try {
      final stores = await _storeRepo.getStores();
      await simulateLatency();
      emit(StoresFetched(stores: stores));
    } catch (e) {
      log(e.toString());
      emit(StoreState(status: BlocStatus.failure, message: e.toString()));
    }
  }

  void _onGetStore(
    GetStore event,
    Emitter<StoreState> emit,
  ) async {
    emit(const StoreState(status: BlocStatus.loading));
    try {
      final store = await _storeRepo.getStore(event.storeId);
      await simulateLatency();
      emit(StoreFetched(store: store));
    } catch (e) {
      log(e.toString());
      emit(StoreState(status: BlocStatus.failure, message: e.toString()));
    }
  }

  void _onGetBranches(
    GetBranches event,
    Emitter<StoreState> emit,
  ) async {
    emit(const StoreState(status: BlocStatus.loading));
    try {
      final branches = await _storeRepo.getBranches(event.mallId);
      await simulateLatency();
      emit(BranchesFetched(branches: branches));
    } catch (e) {
      log(e.toString());
      emit(StoreState(status: BlocStatus.failure, message: e.toString()));
    }
  }

  void _onGetBranch(
    GetBranch event,
    Emitter<StoreState> emit,
  ) async {
    emit(const StoreState(status: BlocStatus.loading));
    try {
      final branch = await _storeRepo.getBranch(event.branchId);
      await simulateLatency();
      emit(BranchFetched(branch: branch));
    } catch (e) {
      log(e.toString());
      emit(StoreState(status: BlocStatus.failure, message: e.toString()));
    }
  }
}
