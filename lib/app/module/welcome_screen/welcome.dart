import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/routes/app_routes.dart';

import '../../const/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   _navigateToNextScreen();
  // }

  // void _navigateToNextScreen() async {
  //   await Future.delayed(Duration(seconds: 5));

  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => SignInScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: Center(
          child: SizedBox(
            height: screenHeight * 0.080,
            width: screenWidth * 0.500,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, sign_in_screen);
              },
              child: Image.asset(
                "assets/logo/logo.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ));
  }
}
