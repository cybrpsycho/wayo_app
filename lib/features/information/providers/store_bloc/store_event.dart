part of 'store_bloc.dart';

abstract class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object> get props => [];
}

class GetStores extends StoreEvent {}

class SetSelectedStore extends StoreEvent {
  final Store store;

  const SetSelectedStore({required this.store});
}
