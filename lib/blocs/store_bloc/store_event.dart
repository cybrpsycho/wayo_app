part of "store_bloc.dart";

abstract class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object> get props => [];
}

class GetStores extends StoreEvent {}

class GetBranches extends StoreEvent {
  final String mallId;

  const GetBranches({required this.mallId});
}

class GetStore extends StoreEvent {
  final String storeId;

  const GetStore({required this.storeId});
}

class GetBranch extends StoreEvent {
  final String branchId;

  const GetBranch({required this.branchId});
}
