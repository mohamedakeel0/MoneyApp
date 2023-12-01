import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_cubic.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_state.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:moneyapp/features/login/presentation/widget/two_underline_text.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:moneyapp/shared/default_form_field.dart';

class SuccessfullyScreen extends StatefulWidget {
  const SuccessfullyScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfullyScreen> createState() => _SuccessfullyScreenState();
}

class _SuccessfullyScreenState extends State<SuccessfullyScreen> {
  var code;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(leading:const SizedBox(),
        title: const Text(
          AppStrings.successfully,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s25,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width /
                        AppResponsiveWidth.w325,
                    child: const Text(
                      AppStrings.titleSuccessfully,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: AppSize.s16,
                        color: AppColors.gray2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h80,
                  ),
                  Center(
                    child: Image(
                      height: MediaQuery.of(context).size.height /
                          AppResponsiveHeigh.h200,
                      width: MediaQuery.of(context).size.width,
                      image: const AssetImage(
                        ImageAssets.done,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h120,
                  ),
                  defaultButton(
                      height: MediaQuery.of(context).size.height /
                          AppResponsiveHeigh.h40,
                      radius: AppConstance.ten,
                      textStyle: const TextStyle(
                        fontSize: FontSize.s16,
                        fontFamily: 'DancingScript',
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      shape: false,
                      width: MediaQuery.of(context).size.width /
                          AppResponsiveWidth.w300,
                      background: AppColors.colorPrimary,
                      context: context,
                      function: () {

                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      text: AppStrings.goToLoin,
                      isUpperCase: false),
                ]),
          ),
        ),
      ),
    );
  }
}
