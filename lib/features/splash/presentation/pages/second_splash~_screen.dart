import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {

    Timer(const Duration(seconds: 3),
            () async{
          Navigator.popAndPushNamed(context, Routes.onboardingRoute);

        });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.colorPrimaryDark,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark),
      child: Scaffold(backgroundColor: AppColors.colorPrimary,
      body:Container(  width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(ImageAssets.backGround),
        fit: BoxFit.cover,
      ),
        ),) ,
      ),
    );
  }

}
