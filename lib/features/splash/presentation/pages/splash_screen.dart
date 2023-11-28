import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
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
          Navigator.popAndPushNamed(context, Routes.secondSplashRoute);
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(height: MediaQuery.of(context).size
          .height,width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image:DecorationImage( image: AssetImage(ImageAssets.splash) ,fit: BoxFit.cover),
          )
      ),
    );
  }
}