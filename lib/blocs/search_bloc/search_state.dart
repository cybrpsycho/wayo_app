part of 'search_bloc.dart';

class SearchState extends Equatable {
  final LoadingStatus status;
  final String? errorMessage;
  final List<Mall> malls;
  final List<Store> stores;
  final List<Branch> branches;

  const SearchState({
    this.status = LoadingStatus.initial,
    this.malls = const [],
    this.stores = const [],
    this.branches = const [],
    this.errorMessage,
  });

  SearchState copyWith({
    required LoadingStatus status,
    List<Mall>? malls,
    List<Store>? stores,
    List<Branch>? branches,
    String? errorMessage,
  }) {
    return SearchState(
      status: status,
      malls: malls ?? this.malls,
      stores: stores ?? this.stores,
      branches: branches ?? this.branches,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, malls, stores, branches, errorMessage];
}
