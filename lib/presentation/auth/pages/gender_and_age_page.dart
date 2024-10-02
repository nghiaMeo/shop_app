

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:shop_app/common/bloc/button/button_state.dart';
import 'package:shop_app/common/helper/bottomsheet/app_bottom_sheet.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';
import 'package:shop_app/common/widgets/button/basic_reactive_button.dart';
import 'package:shop_app/core/configs/theme/app_colors.dart';
import 'package:shop_app/presentation/auth/bloc/gender_selection_cubit.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../data/auth/models/user_creation_req.dart';
import '../../../domain/auth/usecase/signup_use_case.dart';
import '../bloc/age_display_cubit.dart';
import '../bloc/age_selection_cubit.dart';

import '../widgets/ages_widget.dart';

class GenderAndAgePage extends StatelessWidget {
  final UserCreationReq userCreationReq;

  const GenderAndAgePage({required this.userCreationReq, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SafeArea(
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => GenderSelectionCubit()),
              BlocProvider(create: (context) => AgeSelectionCubit()),
              BlocProvider(create: (context) => AgesDisplayCubit()),
              BlocProvider(create: (context) => ButtonStateCubit())
            ],
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  var snackBar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText(
                            title: 'Tell us About yourself',
                            fontSize: 32,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 20),
                        _buildText(
                            title: 'Who do you shop for ?',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        const SizedBox(height: 20),
                        _genders(context),
                        const SizedBox(height: 20),
                        _buildText(
                            title: 'How Old are you ?',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 20),
                        _age(context),
                      ],
                    ),
                  ),
                  Spacer(),
                  _buildFinishButton(context)
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildText({
    required String title,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          genderTitle(context, 1, 'Men'),
          SizedBox(width: 20),
          genderTitle(context, 2, 'Women')
        ],
      );
    });
  }

  Expanded genderTitle(BuildContext context, int genderIndex, String gender) {
    int selectedIndex = context.watch<GenderSelectionCubit>().state;
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: selectedIndex == genderIndex
                ? AppColors.primary
                : (context.isDarkMode
                    ? AppColors.secondBackgroundDark
                    : AppColors.secondBackgroundLight),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }

  Widget _age(BuildContext context) {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomSheet.display(
            context,
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges())
              ],
              child: AgesWidget(),
            ),
          );
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.secondBackgroundDark
                : AppColors.secondBackgroundLight,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(state),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildFinishButton(BuildContext context) {
    return Container(
      height: 100,
      color: context.isDarkMode
          ? AppColors.secondBackgroundDark
          : AppColors.secondBackgroundLight,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
              title: 'Finish',
              onPressed: () {
                userCreationReq.gender = context.read<GenderSelectionCubit>().selectedIndex;
                userCreationReq.age =
                    context.read<AgeSelectionCubit>().selectedAge;
                context
                    .read<ButtonStateCubit>()
                    .execute(useCase: SignupUsecase(), params: userCreationReq);
              });
        }),
      ),
    );
  }
}
