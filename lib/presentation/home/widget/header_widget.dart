import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/core/configs/assets/app_images.dart';
import 'package:shop_app/core/configs/assets/app_vectors.dart';
import 'package:shop_app/domain/auth/entity/user_entity.dart';
import 'package:shop_app/presentation/choose_mode/pages/choose_theme_page.dart';
import 'package:shop_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:shop_app/presentation/home/bloc/user_info_display_state.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../core/configs/theme/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Padding(
        padding: EdgeInsets.only(top: 10, right: 16, left: 16),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
            if (state is UserInfoLoading) {
              return Center(child: const CircularProgressIndicator());
            }
            if (state is UserInfoLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProfileImage(context, state.user),
                  _buildGender(context, state.user),
                  _buildButtonCard(context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context, UserEntity user) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: user.image.isEmpty
              ? AssetImage(AppImages.profile)
              : NetworkImage(user.image),
        ),
      ),
    );
  }

  Widget _buildGender(BuildContext context, UserEntity user) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.secondBackgroundDark
              : AppColors.secondBackgroundLight,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          user.gender == 1 ? "Men" : "Women",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, ChooseThemePage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
