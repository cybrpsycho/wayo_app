part of "store_bloc.dart";

class StoreState extends Equatable {
  final BlocStatus status;
  final String? message;
  const StoreState({this.status = BlocStatus.initial, this.message});

  @override
  List<Object?> get props => [status, message];
}

class StoresFetched extends StoreState {
  final List<Store> stores;

  const StoresFetched({
    super.status = BlocStatus.success,
    required this.stores,
  });

  @override
  List<Object> get props => [stores];
}

class StoreFetched extends StoreState {
  final Store store;

  const StoreFetched({
    super.status = BlocStatus.success,
    required this.store,
  });

  @override
  List<Object> get props => [store];
}

class BranchesFetched extends StoreState {
  final List<Branch> branches;

  const BranchesFetched({
    super.status = BlocStatus.success,
    required this.branches,
  });

  @override
  List<Object> get props => [branches];
}

class BranchFetched extends StoreState {
  final Branch branch;

  const BranchFetched({
    super.status = BlocStatus.success,
    required this.branch,
  });

  @override
  List<Object> get props => [branch];
}
