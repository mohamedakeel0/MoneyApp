import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/features/login/presentation/widget/two_underline_text.dart';
import 'package:moneyapp/features/login/presentation/widget/under_line_text.dart';
import 'package:moneyapp/features/regisiter/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_cubic.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_state.dart';
import 'package:moneyapp/features/regisiter/presentation/widget/text_form_and_title.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:moneyapp/shared/default_form_field.dart';

class RegisiterScreen extends StatefulWidget {
  const RegisiterScreen({Key? key}) : super(key: key);

  @override
  State<RegisiterScreen> createState() => _RegisiterScreenState();
}

class _RegisiterScreenState extends State<RegisiterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisiterCubic, RegisiterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubic = RegisiterCubic.get(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Form(
              key: cubic.formkey,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 90.0.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.signUpTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          AppStrings.titleRegisiter,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: AppColors.grayMedium2,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: AppColors.backGroundPrimary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.sp),
                                  topLeft: Radius.circular(30.sp))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 25.0.h, horizontal: 25.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        buildTextFormAndTitle(context,
                                            validationName:
                                                AppStrings.validationFristName,
                                            fristText: AppStrings.fristName,
                                            cubit: cubic,
                                            textEditingControllerFrist:
                                                cubic.fristNameController),
                                        cubic.validationFristName == true
                                            ? SizedBox(
                                                height: 2.h,
                                              )
                                            : SizedBox(),
                                        cubic.validationFristName == true
                                            ? Text(
                                                AppStrings.validationFristName,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: 'DancingScript',
                                                  color: AppColors.red,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        buildTextFormAndTitle(context,
                                            cubit: cubic,
                                            fristText: AppStrings.lastName,
                                            validationName:
                                                AppStrings.validationSecondName,
                                            textEditingControllerFrist:
                                                cubic.secondNameController),
                                        cubic.validationSecondName == true
                                            ? SizedBox(
                                                height: 2.h,
                                              )
                                            : SizedBox(),
                                        cubic.validationSecondName == true
                                            ? Text(
                                                AppStrings.validationFristName,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: 'DancingScript',
                                                  color: AppColors.red,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  AppStrings.email,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.sp,
                                    color: AppColors.colorPrimaryDark,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 35.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10),
                                  ),
                                  child: defaultFormField(
                                    context: context,
                                    onTap: () {},
                                    prefix: null,
                                    prefixIsImage: false,
                                    textStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    iconSize: 10.h,
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
                                    },
                                  ),
                                ),
                                cubic.validationEmail == true
                                    ? SizedBox(
                                        height: 2.h,
                                      )
                                    : SizedBox(),
                                cubic.validationEmail == true
                                    ? Text(
                                        AppStrings.enterYourEmail,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'DancingScript',
                                          color: AppColors.red,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  AppStrings.phone,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.sp,
                                    color: AppColors.colorPrimaryDark,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 35.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10),
                                  ),
                                  child: defaultFormField(
                                    context: context,
                                    onTap: () {},
                                    prefix: null,
                                    prefixIsImage: false,
                                    textStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    iconSize: 10.h,
                                    isEnabled: true,
                                    hintText: AppStrings.enterYourPhone,
                                    isError: true,
                                    isFocusBorder: true,
                                    controller: cubic.phoneController,
                                    type: TextInputType.phone,
                                    validate: (value) {
                                      if (cubic.phoneController.text
                                          .trim()
                                          .isEmpty) {
                                        cubic.validation(
                                            AppStrings.enterYourPhone, true);
                                      } else {
                                        cubic.validation(
                                            AppStrings.enterYourPhone, false);
                                      }
                                    },
                                  ),
                                ),
                                cubic.validationPhone == true
                                    ? SizedBox(
                                        height: 2.h,
                                      )
                                    : SizedBox(),
                                cubic.validationPhone == true
                                    ? Text(
                                        AppStrings.enterYourPhone,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'DancingScript',
                                          color: AppColors.red,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  AppStrings.password,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.sp,
                                    color: AppColors.colorPrimaryDark,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 35.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10),
                                  ),
                                  child: defaultFormField(
                                    context: context,
                                    onTap: () {},
                                    hintText: AppStrings.enterYourPassword,
                                    prefix: null,
                                    prefixIsImage: false,
                                    textStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    iconSize: 10.h,
                                    isEnabled: true,
                                    isError: true,
                                    isFocusBorder: true,
                                    controller: cubic.passwordController,
                                    isPassword: cubic.isNewPassword,
                                    suffix: cubic.isNewPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off,
                                    suffixPressed: () {
                                      cubic.changePasswordVisibility(
                                          AppStrings.newPassword);
                                    },
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
                                    },
                                  ),
                                ),
                                cubic.validationPassword == true
                                    ? SizedBox(
                                        height: 2.h,
                                      )
                                    : SizedBox(),
                                cubic.validationPassword == true
                                    ? Text(
                                        AppStrings.enterYourPassword,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'DancingScript',
                                          color: AppColors.red,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  AppStrings.comfirmPassword,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.sp,
                                    color: AppColors.colorPrimaryDark,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 35.h,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10),
                                  ),
                                  child: defaultFormField(
                                    context: context,
                                    onTap: () {},
                                    hintText: AppStrings.enterYourPassword,
                                    prefix: null,
                                    prefixIsImage: false,
                                    textStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    iconSize: 10.h,
                                    isEnabled: true,
                                    isError: true,
                                    isFocusBorder: true,
                                    controller: cubic.comfirmPasswordController,
                                    isPassword: cubic.isComfiremPassword,
                                    suffix: cubic.isComfiremPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off,
                                    suffixPressed: () {
                                      cubic.changePasswordVisibility(
                                          AppStrings.comfirmPassword);
                                    },
                                    type: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (cubic.comfirmPasswordController.text
                                          .trim()
                                          .isEmpty) {
                                        cubic.validation(
                                            AppStrings.enterYourComfirmPassword,
                                            true);
                                      } else {
                                        cubic.validation(
                                            AppStrings.enterYourComfirmPassword,
                                            false);
                                      }
                                    },
                                  ),
                                ),
                                cubic.validationComfirmPassword == true
                                    ? SizedBox(
                                        height: 2.h,
                                      )
                                    : SizedBox(),
                                cubic.validationComfirmPassword == true
                                    ? Text(
                                        AppStrings.enterYourComfirmPassword,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'DancingScript',
                                          color: AppColors.red,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Center(
                                  child: Text(
                                    AppStrings.setYourPriorities,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      color: AppColors.colorPrimaryDark,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              cubic.changePriorities(1);
                                            },
                                            child: Icon(
                                              cubic.counts == 1
                                                  ? Icons.check_box_rounded
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: cubic.counts == 1
                                                  ? AppColors.colorPrimary
                                                  : AppColors.gray2,
                                              size: 20.sp,
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          AppStrings.scanMoney,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13.sp,
                                            color: AppColors.gray2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              cubic.changePriorities(2);
                                            },
                                            child: Icon(
                                              cubic.counts == 2
                                                  ? Icons.check_box_rounded
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: cubic.counts == 2
                                                  ? AppColors.colorPrimary
                                                  : AppColors.gray2,
                                              size: 20.sp,
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          AppStrings.checkYourArea,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13.sp,
                                            color: AppColors.gray2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              cubic.changePriorities(3);
                                            },
                                            child: Icon(
                                              cubic.counts == 3
                                                  ? Icons.check_box_rounded
                                                  : Icons
                                                      .check_box_outline_blank,
                                              color: cubic.counts == 3
                                                  ? AppColors.colorPrimary
                                                  : AppColors.gray2,
                                              size: 20.sp,
                                            )),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          AppStrings.exchangeHere,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13.sp,
                                            color: AppColors.gray2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                          context, Routes.loginRoute);
                                    },
                                    child: twoTextWithUnderline(
                                        fristText: AppStrings.HaveAn,
                                        secondText: AppStrings.signIn)),
                                SizedBox(
                                  height: 20.h,
                                ),
                                cubic.regisiterState != RequestState.loading
                                    ? Center(
                                        child: defaultButton(
                                            height: 35.h,
                                            radius: AppConstance.ten,
                                            textStyle: const TextStyle(
                                              fontSize: FontSize.s16,
                                              fontFamily: 'DancingScript',
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            shape: false,
                                            width: 300.w,
                                            background: AppColors.colorPrimary,
                                            context: context,
                                            function: () {
                                              if (cubic.formkey.currentState!
                                                  .validate()) {
                                                if (cubic.validationAll !=
                                                    true) {
                                                  cubic.register(
                                                      context,
                                                      RegisterParameters(
                                                        password: cubic
                                                            .passwordController
                                                            .text,
                                                        email: cubic
                                                            .emailController
                                                            .text,
                                                        confirmPassword: cubic
                                                            .comfirmPasswordController
                                                            .text,
                                                        firstName: cubic
                                                            .fristNameController
                                                            .text,
                                                        lastName: cubic
                                                            .secondNameController
                                                            .text,
                                                        phoneNumber: cubic
                                                            .phoneController
                                                            .text,
                                                      ));

                                                }
                                              }
                                            },
                                            text: AppStrings.signUp,
                                            isUpperCase: false),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(
                                        color: AppColors.colorPrimary,
                                      )),
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
