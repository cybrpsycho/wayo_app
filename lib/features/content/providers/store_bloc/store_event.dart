part of 'store_bloc.dart';

abstract class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object> get props => [];
}

class GetStores extends StoreEvent {}

class GetStoresInMall extends StoreEvent {
  final String mallId;

  const GetStoresInMall({required this.mallId});
}

class GetStore extends StoreEvent {
  final String storeId;

  const GetStore({required this.storeId});
}
