import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/common/widgets/appbar/app_bar_widget.dart';
import 'package:shop_app/core/configs/assets/app_vectors.dart';
import 'package:shop_app/presentation/auth/pages/sign_in_page.dart';

import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/button/basic_app_button.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: BasicAppbar(hideBack: true),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                _buildSvgSentEmail(),
                SizedBox(height: 20),
                _buildText(),
                SizedBox(height: 20),
                _buildPressButton(context),
                Spacer(),
              ],
            )),
      ),
    );
  }

  Widget _buildSvgSentEmail() {
    return SvgPicture.asset(
      AppVectors.emailSending,
      width: 150
    );
  }

  Widget _buildText() {
    return Text(
      'We Sent you an Email to reset your password.',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPressButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          AppNavigator.pushReplacement(context, SignInPage());
        },
        width: 200,
        title: 'Return to Login');
  }
}
