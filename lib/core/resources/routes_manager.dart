


import 'package:flutter/material.dart';

import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/forget_password/presentation/screen/forget_password_screen.dart';
import 'package:moneyapp/features/forget_password/presentation/screen/varification_screen.dart';
import 'package:moneyapp/features/login/presentation/screen/login_screen.dart';
import 'package:moneyapp/features/onboarding/presentation/screen/on_boarding_screen.dart';
import 'package:moneyapp/features/regisiter/presentation/screen/regisiter_screen.dart';
import 'package:moneyapp/features/splash/presentation/pages/second_splash~_screen.dart';
import 'package:moneyapp/features/splash/presentation/pages/splash_screen.dart';
class Routes{
  static const String splashRoute ='/';
  static const String secondSplashRoute ='/second';
  static const String onboardingRoute ='/onboarding';
  static const String loginRoute ='/login';
  static const String regisiterRoute ='/regisiter';
  static const String forgetPasswordRoute ='/forgetPassword';
  static const String varificationRoute ='/varification';





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
        case Routes.regisiterRoute:
        return MaterialPageRoute(builder: (_)=> const RegisiterScreen());
        case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen());
        case Routes.varificationRoute:
        return MaterialPageRoute(builder: (_)=> const VarificationScreen());


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