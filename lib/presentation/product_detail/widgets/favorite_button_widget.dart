import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/domain/product/entities/product_entity.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../bloc/favorite_icon_cubit.dart';

class FavoriteButtonWidget extends StatelessWidget {
  late final ProductEntity productEntity;

  FavoriteButtonWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconCubit>().onTap(productEntity);
      },
      icon: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.secondBackgroundDark
                : AppColors.secondBackgroundLight,
            shape: BoxShape.circle),
        child: BlocBuilder<FavoriteIconCubit, bool>(
          builder: (context, state) => Icon(
              state ? Icons.favorite : Icons.favorite_outline,
              size: 15,
              color: Colors.red),
        ),
      ),
    );
  }
}
