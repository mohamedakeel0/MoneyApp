import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubic, LoginState>(listener: (context, state) {

    },builder: (context, state) {
      var cubic = LoginCubic.get(context);
      return  Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                AppStrings.login,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.s25,
                  color: AppColors.black,
                ),
              ),
              Text(
                AppStrings.titleLogin,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: AppSize.s16,
                  color: AppColors.grayMedium2,
                ),
              ),
              SizedBox(
                height:
                MediaQuery.of(context).size.height / AppResponsiveHeigh.h35,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 215,
                decoration: const BoxDecoration(
                    color: AppColors.backGroundPrimary,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppSize.s30),
                        topLeft: Radius.circular(AppSize.s30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 35.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: const [
                    Text(
                      AppStrings.email,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: AppSize.s16,
                        color: AppColors.colorPrimaryDark,
                      ),
                    ),
                  ],),
                ),
              )
            ]),
          ),
        ),
      );
    },

    );
  }
}
