import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/core/configs/theme/app_colors.dart';

import '../../../common/bloc/product/products_display_cubit.dart';
import '../../../core/configs/assets/app_vectors.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 8
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: (value){
          if (value.isEmpty) {
            context.read<ProductsDisplayCubit>().displayInitial();
          } else {
            context.read<ProductsDisplayCubit>().displayProducts(params: value);
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50)
            ),
            prefixIcon:  SvgPicture.asset(
              AppVectors.search,
              fit: BoxFit.none,
              color: context.isDarkMode ? AppColors.secondBackgroundLight: AppColors.secondBackgroundDark,

            ),
            hintText: 'search'
        ),
      ),
    );
  }
}