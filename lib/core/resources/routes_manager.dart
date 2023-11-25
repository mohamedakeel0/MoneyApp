


import 'package:flutter/material.dart';

import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/login/presentation/screen/login_screen.dart';
import 'package:moneyapp/features/onboarding/presentation/screen/on_boarding_screen.dart';
import 'package:moneyapp/features/splash/presentation/pages/second_splash~_screen.dart';
import 'package:moneyapp/features/splash/presentation/pages/splash_screen.dart';
class Routes{
  static const String splashRoute ='/';
  static const String secondSplashRoute ='/second';
  static const String onboardingRoute ='/onboarding';
  static const String loginRoute ='/login';





}
class RouteGenerator{
  static Route<dynamic>  getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
        case Routes.secondSplashRoute:
        return MaterialPageRoute(builder: (_)=>const SecondSplashScreen());
        case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_)=> OnboardingScreen());
        case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> const LoginScreen());


      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic>unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title: Text(AppStrings.noRoutefound),),body: Center(child: Text(AppStrings.noRoutefound),),
    ));
  }
}