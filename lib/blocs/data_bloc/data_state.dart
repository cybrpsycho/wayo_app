part of 'data_bloc.dart';

class DataState extends Equatable {
  final LoadingStatus status;
  final List<Mall> malls;
  final List<Store> stores;
  final List<Category> categories;
  final Mall? mall;
  final Store? store;

  const DataState({
    this.status = LoadingStatus.initial,
    this.malls = const [],
    this.stores = const [],
    this.categories = const [],
    this.mall,
    this.store,
  });

  DataState copyWith({
    LoadingStatus? status,
    List<Mall> ?malls ,
    List<Store> ?stores ,
    List<Category>? categories,
    Mall? mall,
    Store? store,
  }) {
    return DataState(
      status: status ?? this.status,
      malls: malls ?? this.malls,
      stores: stores ?? this.stores,
      categories: categories ?? this.categories,
      mall: mall ?? this.mall,
      store: store ?? this.store,
    );
  }

  @override
  List<Object?> get props => [status, malls, stores, categories, mall, store];
}
