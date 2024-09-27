import 'package:flutter/material.dart';
import 'package:shop_app/common/helper/navigator/app_navigator.dart';
import 'package:shop_app/common/widgets/appbar/app_bar_widget.dart';
import 'package:shop_app/common/widgets/rich_text/rich_text_widget.dart';
import 'package:shop_app/data/auth/models/user_signin_req.dart';
import 'package:shop_app/presentation/auth/pages/enter_password.dart';
import 'package:shop_app/presentation/auth/pages/signup_page.dart';

import '../../../common/widgets/button/basic_app_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40,
          ),
          child: CustomScrollView(slivers: [
            SliverList.list(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(),
                    const SizedBox(height: 20),
                    _buildTextField(),
                    const SizedBox(height: 20),
                    _buildPressButton(context),
                    const SizedBox(height: 20),
                    RichTextWidget(
                      title: "Don't you have an account? ",
                      titleOnPress: 'Create One',
                      onPage: SignupPage(),
                    ),
                  ],
                ),
              ],
            )
          ]),
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
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _buildPressButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
            context,
            EnterPassword(
              userSigninReq:
                  UserSigninReq(email: _emailController.text, password: ''),
            ));
      },
      title: 'Continue',
    );
  }
}
