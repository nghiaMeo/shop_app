import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import '../../../common/bloc/categories/categories_display_cubit.dart';
import '../../../common/bloc/categories/categories_display_state.dart';
import '../../../common/helper/images/image_display_helper.dart';
import '../../../common/helper/navigator/app_navigator.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../category_products/pages/category_products_page.dart';

class DetailCategoriesPage extends StatelessWidget {
  const DetailCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shopByCategories(),
              const SizedBox(
                height: 10,
              ),
              _categories()
            ],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories() {
    return const Text(
      'Shop by Categories',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget _categories() {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesLoaded) {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    AppNavigator.push(context, CategoryProductsPage(categoryEntity: state.categories[index],));
                  },
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: context.isDarkMode
                            ? AppColors.secondBackgroundDark
                            : AppColors.secondBackgroundLight,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(ImageDisplayHelper
                                      .generateCategoryImageURL(
                                          state.categories[index].image)))),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          state.categories[index].title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: state.categories.length);
        }
        return Container();
      },
    );
  }
}
