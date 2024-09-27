import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/appbar/app_bar_widget.dart';
import 'package:shop_app/common/widgets/rich_text/rich_text_widget.dart';
import 'package:shop_app/data/auth/models/user_creation_req.dart';
import 'package:shop_app/presentation/auth/pages/forgot_password_page.dart';
import 'package:shop_app/presentation/auth/pages/gender_and_age_page.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              _buildText(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                        hintText: 'First Name',
                        controller: _firstNameController,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        hintText: 'Last Name',
                        controller: _lastNameController,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        hintText: 'Email Address',
                        controller: _emailController,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        hintText: 'Password',
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      SizedBox(height: 20),
                      _buildPressButton(context),
                      SizedBox(height: 20),
                      RichTextWidget(
                          title: "Forgot Password? ",
                          titleOnPress: 'Reset',
                          onPage: ForgotPasswordPage())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      'Create Account',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required TextEditingController controller,
      bool? isPassword}) {
    return TextField(
      obscureText: isPassword ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }

  Widget _buildPressButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgePage(
            userCreationReq: UserCreationReq(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            ),
          ),
        );
      },
      title: 'Continue',
    );
  }
}
