import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/product/entities/product_entity.dart';
import '../bloc/product_color_selection_cubit.dart';

class ProductColorsWidget extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductColorsWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'Color',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BlocBuilder<ProductColorSelectionCubit, int>(
                    builder: (context, state) => GestureDetector(
                      onTap: () {
                        context
                            .read<ProductColorSelectionCubit>()
                            .itemSelection(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: state == index
                                ? AppColors.primary
                                : (context.isDarkMode
                                    ? AppColors.secondBackgroundDark
                                    : AppColors.secondBackgroundLight),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productEntity.colors[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                        productEntity.colors[index].rgb[0],
                                        productEntity.colors[index].rgb[1],
                                        productEntity.colors[index].rgb[2],
                                        1),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                state == index
                                    ? const Icon(
                                        Icons.check,
                                        size: 30,
                                      )
                                    : Container(
                                        width: 30,
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: productEntity.colors.length),
          ),
        ],
      ),
    );
  }
}
