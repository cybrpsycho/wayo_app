part of 'store_bloc.dart';

abstract class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoreFetched extends StoreState {
  final List<Store> stores;

  const StoreFetched({required this.stores});

  @override
  List<Object> get props => [stores];
}

class StoreSelected extends StoreState {
  final Store store;

  const StoreSelected({required this.store});

  @override
  List<Object> get props => [store];
}

class StoreError extends StoreState {
  final String errorMessage;

  const StoreError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
