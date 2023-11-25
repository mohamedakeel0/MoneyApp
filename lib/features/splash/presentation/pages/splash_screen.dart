import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/features/splash/presentation/widgets/splash_widgets.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isChange=false;
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
            () async{
setState(() {
  isChange=true;

  Timer(const Duration(seconds: 2),
          () async{
            Navigator.popAndPushNamed(context, Routes.secondSplashRoute);

      });
});

        });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: Center(
        child: SplashWidget(isChange: isChange),
      ),
    );
  }
}
