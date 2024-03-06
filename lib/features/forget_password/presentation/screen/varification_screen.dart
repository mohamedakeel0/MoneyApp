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

class VarificationScreen extends StatefulWidget {
  const VarificationScreen({Key? key}) : super(key: key);

  @override
  State<VarificationScreen> createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {
  var code;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.varification,
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
                    width: MediaQuery.of(context).size.width /
                        AppResponsiveWidth.w325,
                    child: const Text(
                      AppStrings.titleVarification,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: AppSize.s16,
                        color: AppColors.grayMedium2,
                      ),
                    ),
                  ),
                  Center(
                    child: Image(
                      height: MediaQuery.of(context).size.height /
                          AppResponsiveHeigh.h336,
                      width: MediaQuery.of(context).size.width,
                      image: const AssetImage(
                        ImageAssets.varification,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h300,
                    decoration: const BoxDecoration(
                        color: AppColors.backGroundPrimary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppSize.s30),
                            topLeft: Radius.circular(AppSize.s30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          VerificationCode(
                            underlineUnfocusedColor: AppColors.colorPrimaryDark,
                            underlineColor: Colors.black,
                            keyboardType: TextInputType.number,
                            textStyle: Theme.of(context).textTheme.headline6!,
                            length: AppConstance.verificationCodeLength,
                            fillColor: AppColors.white,
                            underlineWidth:
                                AppConstance.verificationUnderlineWidth,
                            autofocus: true,
                            fullBorder: true,
                            itemSize: 45.0,
                            onCompleted: (value) {
                              code = value;
                            },
                            onEditing: (bool value) {},
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h35,
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
                                    context, Routes.changePasswordRoute,arguments: false);
                              },
                              text: AppStrings.verify,
                              isUpperCase: false),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h45,
                          ),
                          GestureDetector(
                            child: twoTextWithUnderline(
                                fristText: AppStrings.didReceived,
                                secondText: AppStrings.resend),
                            onTap: () {
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
