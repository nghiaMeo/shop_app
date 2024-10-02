import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:shop_app/common/bloc/categories/categories_display_state.dart';
import 'package:shop_app/common/helper/images/image_display_helper.dart';
import 'package:shop_app/common/helper/navigator/app_navigator.dart';
import 'package:shop_app/domain/category/entity/category_entity.dart';
import 'package:shop_app/presentation/all_categories/pages/detail_categories_page.dart';

import '../../category_products/pages/category_products_page.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return CircularProgressIndicator();
          }

          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _buildSeeAllCategories(context),
                SizedBox(height: 20),
                _buildListCategories(state.categories),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSeeAllCategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, DetailCategoriesPage());
            },
            child: Text(
              'See All',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListCategories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(
                        context,
                        CategoryProductsPage(
                          categoryEntity: categories[index],
                        ));
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          ImageDisplayHelper.generateCategoryImageURL(
                              categories[index].image),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  categories[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 15,
              ),
          itemCount: categories.length),
    );
  }
}
