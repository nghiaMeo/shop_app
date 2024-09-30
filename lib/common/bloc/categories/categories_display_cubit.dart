import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/bloc/categories/categories_display_state.dart';
import 'package:shop_app/domain/category/usecases/get_categories_use_case.dart';

import '../../../service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnData = await sl<GetCategoriesUseCase>().call();
    returnData.fold((error) {
      emit(CategoriesFailure());
    }, (data) {
      emit(CategoriesLoaded(categories: data));
    });
  }
}
