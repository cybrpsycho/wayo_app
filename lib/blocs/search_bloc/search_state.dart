part of "search_bloc.dart";

class SearchState extends Equatable {
  final BlocStatus status;
  final String? errorMessage;
  final List<Result> results;

  const SearchState({
    this.status = BlocStatus.initial,
    this.results = const [],
    this.errorMessage,
  });

  SearchState copyWith({
    required BlocStatus status,
    List<Result>? results,
    String? errorMessage,
  }) {
    return SearchState(
      status: status,
      results: results ?? this.results,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, results, errorMessage];
}
