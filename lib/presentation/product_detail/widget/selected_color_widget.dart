import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/helper/bottomsheet/app_bottom_sheet.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/domain/product/entities/product_entity.dart';
import 'package:shop_app/presentation/product_detail/widget/product_colors_widget.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../bloc/product_color_selection_cubit.dart';

class SelectedColorWidget extends StatelessWidget {
  final ProductEntity productEntity;

  const SelectedColorWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
            context,
            BlocProvider.value(
                value: BlocProvider.of<ProductColorSelectionCubit>(context),
                child: ProductColorsWidget(
                  productEntity: productEntity,
                )));
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.secondBackgroundDark
              : AppColors.secondBackgroundLight,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Color',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) => Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(
                          productEntity.colors[state].rgb[0],
                          productEntity.colors[state].rgb[1],
                          productEntity.colors[state].rgb[2],
                          1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
