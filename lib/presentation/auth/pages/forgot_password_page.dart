import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/bloc/button/button_state.dart';
import 'package:shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:shop_app/common/helper/navigator/app_navigator.dart';
import 'package:shop_app/common/widgets/appbar/app_bar_widget.dart';
import 'package:shop_app/common/widgets/button/basic_reactive_button.dart';
import 'package:shop_app/presentation/auth/pages/password_reset_email_page.dart';
import '../../../domain/usecase/rest_password_email_use_case.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController _resetEmailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _resetEmailController.dispose();
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
            if (state is ButtonSuccessState) {
              AppNavigator.push(context, PasswordResetEmailPage());
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      'Forgot Password',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      obscureText: false,
      controller: _resetEmailController,
      decoration: InputDecoration(
        hintText: 'Enter Email Address',
      ),
    );
  }

  Widget _buildPressButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
              useCase: RestPasswordEmailUseCase(),
              params: _resetEmailController.text,
          );
        },
        title: 'Continue',
      );
    });
  }
}
