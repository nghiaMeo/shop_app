import 'package:flutter/material.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../choose_mode/pages/choose_theme_page.dart';


class ChooseModeWidget extends StatelessWidget {
  const ChooseModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, ChooseThemePage());
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.secondBackgroundDark
                : AppColors.secondBackgroundLight,
            borderRadius: BorderRadius.circular(10)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose Mode',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}