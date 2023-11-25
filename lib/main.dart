import 'package:flutter/material.dart';
import 'package:moneyapp/core/network/cache_helper.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/theme_manager.dart';
import 'package:moneyapp/core/services/services_locator.dart';
import 'package:moneyapp/features/splash/presentation/pages/splash_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: getApplicationTheme(),

      home:   SplashScreen(),
      onGenerateRoute: RouteGenerator.getRoute,
      debugShowCheckedModeBanner: false,
    );
  }


}


