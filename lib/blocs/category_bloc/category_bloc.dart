import "dart:developer";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/config/dev_functions.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/category.dart";
import "package:wayo/repositories/category_repository.dart";

part "category_event.dart";
part "category_state.dart";

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryInitial()) {
    on<GetCategories>(_onGetCategories);
  }

  final _categoryRepo = CategoryRepository();

  void _onGetCategories(
    GetCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryLoading());
    try {
      final categories = await _categoryRepo.getCategories();
      await simulateLatency();
      emit(CategoriesFetched(categories: categories));
    } catch (e) {
      log(e.toString());
      emit(CategoryError(errorMessage: e.toString()));
    }
  }
}
