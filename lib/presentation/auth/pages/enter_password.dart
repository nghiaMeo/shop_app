import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/bloc/button/button_state.dart';
import 'package:shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:shop_app/common/widgets/appbar/app_bar_widget.dart';
import 'package:shop_app/common/widgets/button/basic_reactive_button.dart';
import 'package:shop_app/data/auth/models/user_signin_req.dart';
import 'package:shop_app/domain/usecase/signin_use_case.dart';
import 'package:shop_app/presentation/auth/pages/forgot_password_page.dart';
import '../../../common/widgets/rich_text/rich_text_widget.dart';

class EnterPassword extends StatefulWidget {
  final UserSigninReq userSigninReq;

  EnterPassword({super.key, required this.userSigninReq});

  @override
  State<EnterPassword> createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if(state is ButtonSuccessState){
              log("successfully");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText(),
                const SizedBox(height: 20),
                _buildTextField(),
                const SizedBox(height: 20),
                _buildPressButton(context),
                const SizedBox(height: 20),
                RichTextWidget(
                  title: "Forgot Password? ",
                  titleOnPress: 'Reset',
                  onPage: ForgotPasswordPage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _buildPressButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          widget.userSigninReq.password = _passwordController.text;
          context
              .read<ButtonStateCubit>()
              .execute(useCase: SigninUseCase(), params: widget.userSigninReq);
        },
        title: 'Continue',
      );
    });
  }
}
