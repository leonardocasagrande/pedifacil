import 'package:flutter/material.dart';
import 'package:pedifacil/shared/themes/app_colors.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dominos',
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: AppColors.primary),
      home: LoginPage(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
