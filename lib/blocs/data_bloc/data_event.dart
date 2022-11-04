part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object?> get props => [];
}

class InitializeData extends DataEvent {}

class GetMalls extends DataEvent {}

class GetStores extends DataEvent {
  final String? mallId;

  const GetStores({this.mallId});

  @override
  List<Object?> get props => [mallId];
}

class ViewStore extends DataEvent {
  final Store store;

  const ViewStore({required this.store});

  @override
  List<Object> get props => [store];
}

class ViewMall extends DataEvent {
  final Mall mall;

  const ViewMall({required this.mall});

  @override
  List<Object> get props => [mall];
}
