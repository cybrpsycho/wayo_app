part of 'store_bloc.dart';

abstract class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoresFetched extends StoreState {
  final List<Store> stores;

  const StoresFetched({required this.stores});

  @override
  List<Object> get props => [stores];
}

class StoreFetched extends StoreState {
  final Store store;

  const StoreFetched({required this.store});

  @override
  List<Object> get props => [store];
}

class StoreError extends StoreState {
  final String errorMessage;

  const StoreError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
