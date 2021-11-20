import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>((event, emit) {
      _categorySubscription?.cancel();
      _categorySubscription = _categoryRepository.getAllCategories().listen(
            (categories) => add(
              UpdateCategories(categories),
            ),
          );
    });
    on<UpdateCategories>((event, emit) {
      emit(
        CategoryLoaded(categories: event.categories),
      );
    });
  }
}
