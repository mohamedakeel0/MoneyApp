


import 'package:flutter/material.dart';

import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/Reporting/presentation/screen/view_image_screen.dart';
import 'package:moneyapp/features/add_report/presentation/screen/add_report_screen.dart';
import 'package:moneyapp/features/forget_password/presentation/screen/change_password_screen.dart';
import 'package:moneyapp/features/forget_password/presentation/screen/forget_password_screen.dart';
import 'package:moneyapp/features/forget_password/presentation/screen/successfully.dart';
import 'package:moneyapp/features/forget_password/presentation/screen/varification_screen.dart';
import 'package:moneyapp/features/home/presentation/screen/home_screen.dart';
import 'package:moneyapp/features/login/presentation/screen/login_screen.dart';
import 'package:moneyapp/features/more/presentation/screen/privacy_policy_screen.dart';
import 'package:moneyapp/features/notifications/presentation/screen/notifications_screen.dart';
import 'package:moneyapp/features/onboarding/presentation/screen/on_boarding_screen.dart';
import 'package:moneyapp/features/profile/presentation/screen/profile_screen.dart';
import 'package:moneyapp/features/regisiter/presentation/screen/done_regisiter_screen.dart';
import 'package:moneyapp/features/regisiter/presentation/screen/regisiter_screen.dart';
import 'package:moneyapp/features/splash/presentation/pages/second_splash~_screen.dart';
import 'package:moneyapp/features/splash/presentation/pages/splash_screen.dart';
import 'package:moneyapp/features/top_five_coin/screen/top_five_coin_screen.dart';
class Routes{
  static const String splashRoute ='/';
  static const String secondSplashRoute ='/second';
  static const String onboardingRoute ='/onboarding';
  static const String loginRoute ='/login';
  static const String regisiterRoute ='/regisiter';
  static const String forgetPasswordRoute ='/forgetPassword';
  static const String varificationRoute ='/varification';
  static const String changePasswordRoute ='/changePassword';
  static const String successfullyRoute ='/successfully';
  static const String doneRegisiterScreenRoute ='/doneRegisiter';
  static const String homeRoute ='/home';
  static const String notificationsRoute ='/notifications';
  static const String profileRoute ='/profile';
  static const String viewImageRoute ='/viewImage';
  static const String privacyPolicyRoute ='/privacyPolicy';
  static const String addReportRoute ='/addReport';
  static const String topFiveCoinRoute ='/topFiveCoin';





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
        case Routes.changePasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ChangePasswordScreen());
        case Routes.successfullyRoute:
        return MaterialPageRoute(builder: (_)=> const SuccessfullyScreen());
        case Routes.doneRegisiterScreenRoute:
        return MaterialPageRoute(builder: (_)=> const DoneRegisiterScreen());
        case Routes.homeRoute:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
        case Routes.notificationsRoute:
        return MaterialPageRoute(builder: (_)=> const NotificationsScreen());
        case Routes.profileRoute:
        return MaterialPageRoute(builder: (_)=> const ProfileScreen());
        case Routes.privacyPolicyRoute:
        return MaterialPageRoute(builder: (_)=> const PrivacyPolicyScreen());
        case Routes.addReportRoute:
        return MaterialPageRoute(builder: (_)=> const AddReportScreen());
        case Routes.topFiveCoinRoute:
        return MaterialPageRoute(builder: (_)=> const TopFiveCoinScreen());
        case Routes.viewImageRoute:
        return MaterialPageRoute(builder: (_)=>  ViewImageScreen(image: settings.arguments.toString(),));


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