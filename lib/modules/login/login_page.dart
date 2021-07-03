import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pedifacil/modules/login/login_controller.dart';
import 'package:pedifacil/shared/themes/app_colors.dart';
import 'package:pedifacil/shared/themes/app_images.dart';
import 'package:pedifacil/shared/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                AppImages.logo,
                width: 250,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  "Falta pouco para matar sua fome",
                  style: AppTextStyles.loginText,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              SignInButton(
                Buttons.Google,
                text: "Faça login com o Google",
                onPressed: () {
                  _controller.googleSignIn(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
