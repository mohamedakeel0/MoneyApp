import 'package:flutter/material.dart';
import 'package:moneyapp/core/network/cache_helper.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/theme_manager.dart';
import 'package:moneyapp/core/services/services_locator.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_cubic.dart';
import 'package:moneyapp/features/change_password/presentation/bloc/change_password_cubic.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_cubic.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_cubic.dart';
import 'package:moneyapp/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(providers: [
      BlocProvider( create: (context) => sl<LoginCubic>(),),
      BlocProvider( create: (context) => sl<RegisiterCubic>(),),
      BlocProvider( create: (context) => sl<ChangePasswordCubic>(),),
      BlocProvider( create: (context) => sl<ForgetPasswordCubic>(),),
      BlocProvider( create: (context) => sl<ProfileCubic>(),),
      BlocProvider( create: (context) => sl<AddReportingCubic>(),),
    ],
      child: MaterialApp(

        theme: getApplicationTheme(),

        home:   SplashScreen(),


        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }


}


