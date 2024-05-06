import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';

import 'package:moneyapp/core/services/app_navigator.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/home/presentation/screen/home_screen.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/features/login/presentation/widget/two_underline_text.dart';
import 'package:moneyapp/features/login/presentation/widget/under_line_text.dart';
import 'package:moneyapp/features/regisiter/presentation/screen/regisiter_screen.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:moneyapp/shared/default_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubic, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubic = LoginCubic.get(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Form(
              key: cubic.formkey,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 100.0.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.login,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 20,
                          child: Text(
                            AppStrings.titleLogin,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15.sp,
                              color: AppColors.grayMedium2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height - 190,
                          decoration: BoxDecoration(
                              color: AppColors.backGroundPrimary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.sp),
                                  topLeft: Radius.circular(30.sp))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 25.0.h, horizontal: 30.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.email,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp,
                                    color: AppColors.colorPrimaryDark,
                                  ),
                                ),
                                Container(
                                  height: 35.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: defaultFormField(
                                    context: context,
                                    onTap: () {},
                                    prefix: null,
                                    prefixIsImage: false,
                                    textStyle:
                                    Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge,
                                    iconSize: 10.sp,
                                    isEnabled: true,
                                    hintText: AppStrings.enterYourEmail,
                                    isError: true,
                                    isFocusBorder: true,
                                    controller: cubic.emailController,
                                    type: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (cubic.emailController.text
                                          .trim()
                                          .isEmpty) {
                                        cubic.validation(
                                            AppStrings.enterYourEmail, true);
                                      } else {
                                        cubic.validation(
                                            AppStrings.enterYourEmail, false);
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                cubic.validationEmail == true
                                    ? SizedBox(
                                  height: 2.h,
                                )
                                    : const SizedBox(),
                                cubic.validationEmail == true
                                    ? const Text(
                                  AppStrings.enterYourEmail,
                                  style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontFamily: 'DancingScript',
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                                    : const SizedBox(),
                                Text(
                                  AppStrings.password,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp,
                                    color: AppColors.colorPrimaryDark,
                                  ),
                                ),
                                Container(
                                  height: 35.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: defaultFormField(
                                    context: context,
                                    onTap: () {},
                                    hintText: AppStrings.enterYourPassword,
                                    prefix: null,
                                    prefixIsImage: false,
                                    textStyle:
                                    Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge,
                                    iconSize: 10.sp,
                                    isEnabled: true,
                                    isError: true,
                                    isFocusBorder: true,
                                    controller: cubic.passwordController,
                                    isPassword: true,
                                    type: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (cubic.passwordController.text
                                          .trim()
                                          .isEmpty) {
                                        cubic.validation(
                                            AppStrings.enterYourPassword, true);
                                      } else {
                                        cubic.validation(
                                            AppStrings.enterYourPassword,
                                            false);
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                cubic.validationPassword == true
                                    ? SizedBox(
                                  height: 2.h,
                                )
                                    : const SizedBox(),
                                cubic.validationPassword == true
                                    ? Text(
                                  AppStrings.enterYourPassword,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'DancingScript',
                                    color: AppColors.red,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                                    : const SizedBox(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          cubic.changeSelectBox();
                                        },
                                        child: Icon(
                                          cubic.isSelect == false
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box_rounded,
                                          color: cubic.isSelect == false
                                              ? AppColors.gray2
                                              : AppColors.colorPrimary,
                                          size: 25.sp,
                                        )),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      AppStrings.rememberMe,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                          color: AppColors.gray2,
                                          fontSize: 14.sp,
                                          fontFamily: 'DancingScript'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Center(
                                  child: cubic.loginState !=
                                      RequestState.loading
                                      ? defaultButton(
                                      height: 35.h,
                                      radius: AppConstance.ten,
                                      textStyle: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'DancingScript',
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      shape: false,
                                      width: 250.w,
                                      background: AppColors.colorPrimary,
                                      context: context,
                                      function: () {
                                        if (cubic.formkey.currentState!
                                            .validate()) {
                                          if (cubic.validationAll != true) {
                                            cubic.userLogin(
                                                context, LoginParameters(
                                                email: cubic
                                                    .emailController.text,
                                                password: cubic
                                                    .passwordController
                                                    .text)).then((value) {
                                              Go.push(const HomeScreen());
                                            });
                                          }
                                        }
                                      },
                                      text: AppStrings.loginScreen,
                                      isUpperCase: false)
                                      : const Center(
                                          child: CircularProgressIndicator(
                                            color:AppColors.colorPrimary,)),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                    onTap: () {

                                      Navigator.pushNamed(
                                          context, Routes.forgetPasswordRoute);
                                    },
                                    child: buildUnderLineText(
                                        text: AppStrings.forgetYourPassword)),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: AppColors.gray2,
                                      width: 70.w,
                                      height: 1.h,
                                    ),
                                    Text(
                                      AppStrings.orContinue,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp,
                                        color: AppColors.gray2,
                                      ),
                                    ),
                                    Container(
                                      color: AppColors.gray2,
                                      width: 70.w,
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildItemImageContiener(
                                        isImageWithRadius: false,
                                        context,
                                        AppColors.white,
                                        ImageAssets.google,
                                        heightImage: 25.h,
                                        widthImage: 25.w),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    buildItemImageContiener(
                                      context,
                                      AppColors.white,
                                      ImageAssets.vector,
                                      heightImage: 25.h,
                                      widthImage: 25.w,
                                      isImageWithRadius: false,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    buildItemImageContiener(
                                      context,
                                      AppColors.white,
                                      ImageAssets.facebook,
                                      heightImage: 25.h,
                                      widthImage: 25.w,
                                      isImageWithRadius: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                GestureDetector(
                                  child: twoTextWithUnderline(
                                      fristText: AppStrings.dontHaveAn,
                                      secondText: AppStrings.signUp),
                                  onTap: () {
                                    Go.push(RegisiterScreen());

                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
