import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/services/app_navigator.dart';
import 'package:moneyapp/features/splash/presentation/pages/second_splash~_screen.dart';
import 'package:moneyapp/features/splash/presentation/widgets/splash_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isChange = false;

  @override
  void initState() {
    Timer(const Duration(seconds:8),
            () async {
         Go.pushAndRemoveUntil(SecondSplashScreen());
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
      child: Scaffold(

        body:Container(height: MediaQuery.of(context).size
            .height,width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image:DecorationImage( image: AssetImage(ImageAssets.splash) ,fit: BoxFit.cover),
            )
        ),
      ),
    );
  }
}