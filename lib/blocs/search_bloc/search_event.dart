part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchForItem extends SearchEvent {
  final String query;

  const SearchForItem({required this.query});
}
