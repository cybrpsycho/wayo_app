part of "category_bloc.dart";

abstract class CategoryState extends Equatable {
  final BlocStatus status;
  const CategoryState({required this.status});

  @override
  List<Object> get props => [status];
}

class CategoryInitial extends CategoryState {
  const CategoryInitial({super.status = BlocStatus.initial});
}

class CategoryLoading extends CategoryState {
  const CategoryLoading({super.status = BlocStatus.loading});
}

class CategoriesFetched extends CategoryState {
  final List<Category> categories;

  const CategoriesFetched({
    super.status = BlocStatus.success,
    required this.categories,
  });

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {
  final String errorMessage;

  const CategoryError({
    super.status = BlocStatus.failure,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
