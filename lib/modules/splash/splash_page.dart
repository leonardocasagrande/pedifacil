import 'package:flutter/material.dart';
import 'package:pedifacil/shared/auth/auth_controller.dart';
import 'package:pedifacil/shared/themes/app_colors.dart';
import 'package:pedifacil/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = AuthController();
    _controller.currentUser(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [AppColors.primary, AppColors.secondary])),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(80),
              child: Image.asset(AppImages.logo),
            ),
          ),
        ),
      ),
    );
  }
}
