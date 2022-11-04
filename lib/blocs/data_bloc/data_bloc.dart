import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/configs/enums.dart';
import 'package:wayo/exception.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/models/category.dart';
import 'package:wayo/models/mall.dart';
import 'package:wayo/models/store.dart';
import 'package:wayo/repositories/mall_repository.dart';
import 'package:wayo/repositories/store_repository.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(const DataState()) {
    on<InitializeData>(_onInitializeData);
    on<GetMalls>(_onGetMalls);
    on<GetStores>(_onGetStores);
    on<ViewMall>(_onViewMall);
    on<ViewStore>(_onViewStore);
  }

  void _onInitializeData(
    InitializeData event,
    Emitter<DataState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final mallRepo = locator.get<MallRepository>();
      final storeRepo = locator.get<StoreRepository>();
      emit(state.copyWith(
        status: LoadingStatus.success,
        malls: await mallRepo.getMalls(),
        stores: await storeRepo.getStores(),
        categories: await mallRepo.getCategories(),
      ));
    } on CustomException {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onGetMalls(
    GetMalls event,
    Emitter<DataState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final mallRepo = locator.get<MallRepository>();
      emit(state.copyWith(
        status: LoadingStatus.success,
        malls: await mallRepo.getMalls(),
      ));
    } on CustomException {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onGetStores(
    GetStores event,
    Emitter<DataState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final storeRepo = locator.get<StoreRepository>();
      final mallRepo = locator.get<MallRepository>();
      emit(state.copyWith(
        status: LoadingStatus.success,
        stores: event.mallId != null
            ? await mallRepo.getStoresInMall(event.mallId!)
            : await storeRepo.getStores(),
      ));
    } on CustomException {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onViewMall(
    ViewMall event,
    Emitter<DataState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.success, mall: event.mall));
  }

  void _onViewStore(
    ViewStore event,
    Emitter<DataState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.success, store: event.store));
  }
}
