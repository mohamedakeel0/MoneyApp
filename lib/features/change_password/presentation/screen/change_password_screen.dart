import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/features/change_password/presentation/bloc/change_password_cubic.dart';
import 'package:moneyapp/features/change_password/presentation/bloc/change_password_state.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_cubic.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_state.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:moneyapp/features/login/presentation/widget/two_underline_text.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:moneyapp/shared/default_form_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  bool? isProfile;
   ChangePasswordScreen({required this.isProfile,Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return BlocConsumer<ChangePasswordCubic, ChangePasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubic = ChangePasswordCubic.get(context);
        return Scaffold(appBar: AppBar(title:  const Text(
          AppStrings.changePassword,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s25,
            color: AppColors.black,
          ),
        ),centerTitle: true,backgroundColor:AppColors.white,),
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [



                      Center(
                        child: Image(height: MediaQuery.of(context).size.height /
                            AppResponsiveHeigh.h380,width: MediaQuery.of(context).size.width ,
                          image: const AssetImage(ImageAssets.changePassword,),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height /
                            AppResponsiveHeigh.h400,
                        decoration: const BoxDecoration(
                            color: AppColors.backGroundPrimary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(AppSize.s30),
                                topLeft: Radius.circular(AppSize.s30))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                       widget.isProfile==true?       const Text(
                                AppStrings.currentPassword,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: AppSize.s16,
                                  color: AppColors.colorPrimaryDark,
                                ),
                              ):SizedBox(),
                              widget.isProfile==true?    SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h2,
                              ):SizedBox(),
                              widget.isProfile==true?    Container(
                                height:
                                MediaQuery.of(context)
                                    .size
                                    .height /
                                    AppResponsiveHeigh.h40
                                ,clipBehavior: Clip.antiAliasWithSaveLayer,decoration: BoxDecoration(color:AppColors.white, borderRadius: BorderRadius.circular(AppSize.s10), ),
                                child: defaultFormField(
                                  context: context,
                                  onTap: () {},isPassword: cubic.isCurrentPassword,

                                  suffix:cubic.isCurrentPassword? Icons.visibility_outlined
                                      : Icons.visibility_off,
                                  suffixPressed: () {

                                    cubic.changePasswordVisibility(AppStrings.currentPassword);
                                  },
                                  prefix: null,
                                  prefixIsImage: false,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge,
                                  iconSize: MediaQuery.of(context)
                                      .size
                                      .height /
                                      AppResponsiveHeigh.h10,
                                  isEnabled: true,hintText: AppStrings.enterYourPassword,
                                  isError: true,
                                  isFocusBorder: true,
                                  controller: cubic.passwordController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty) {

                                    }
                                    return null;
                                  },
                                ),
                              ):SizedBox(),
                              widget.isProfile==true?     SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h2,
                              ):SizedBox(),
                              const Text(
                                AppStrings.newPassword,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: AppSize.s16,
                                  color: AppColors.colorPrimaryDark,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h2,
                              ),
                              Container(
                                height:
                                MediaQuery.of(context)
                                    .size
                                    .height /
                                    AppResponsiveHeigh.h40
                                ,clipBehavior: Clip.antiAliasWithSaveLayer,decoration: BoxDecoration(color:AppColors.white, borderRadius: BorderRadius.circular(AppSize.s10), ),
                                child: defaultFormField(
                                  context: context,   onTap: () {},
                                  isPassword: cubic.isNewPassword,

                                  suffix:cubic.isNewPassword? Icons.visibility_outlined
                                      : Icons.visibility_off,
                                  suffixPressed: () {

                                    cubic.changePasswordVisibility(AppStrings.newPassword);
                                  },
                                  prefix: null,
                                  prefixIsImage: false,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge,
                                  iconSize: MediaQuery.of(context)
                                      .size
                                      .height /
                                      AppResponsiveHeigh.h10,
                                  isEnabled: true,hintText: AppStrings.enterYourPassword,
                                  isError: true,
                                  isFocusBorder: true,
                                  controller: cubic.newPasswordController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty) {

                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h2,
                              ),
                              const Text(
                                AppStrings.comfirmPassword,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: AppSize.s16,
                                  color: AppColors.colorPrimaryDark,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h2,
                              ),
                              Container(
                                height:
                                MediaQuery.of(context)
                                    .size
                                    .height /
                                    AppResponsiveHeigh.h40
                                ,clipBehavior: Clip.antiAliasWithSaveLayer,decoration: BoxDecoration(color:AppColors.white, borderRadius: BorderRadius.circular(AppSize.s10), ),
                                child: defaultFormField(
                                  context: context,
                                  onTap: () {},
                                  prefix: null,
                                  prefixIsImage: false,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge,
                                  iconSize: MediaQuery.of(context)
                                      .size
                                      .height /
                                      AppResponsiveHeigh.h10,
                                  isEnabled: true,hintText: AppStrings.enterComfirmPassword,
                                  isError: true,
                                  isFocusBorder: true,  isPassword: cubic.isComfiremPassword,

                                  suffix:cubic.isComfiremPassword? Icons.visibility_outlined
                                      : Icons.visibility_off,
                                  suffixPressed: () {

                                    cubic.changePasswordVisibility(AppStrings.comfirmPassword);
                                  },
                                  controller: cubic.comfirmPasswordController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty) {

                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h30,
                              ),
                              Center(
                                child: defaultButton(
                                    height:
                                    MediaQuery.of(context)
                                        .size
                                        .height /
                                        AppResponsiveHeigh
                                            .h40,
                                    radius: AppConstance
                                        .ten,
                                    textStyle: const TextStyle(
                                      fontSize: FontSize.s16,
                                      fontFamily:
                                      'DancingScript',
                                      color: AppColors.white,
                                      fontWeight:
                                      FontWeight.w400,
                                    ),
                                    shape: false,
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width /
                                        AppResponsiveWidth
                                            .w300,
                                    background: AppColors.colorPrimary,
                                    context: context,
                                    function: () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.successfullyRoute);
                                    },
                                    text: AppStrings.done,
                                    isUpperCase: false),
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
      },
    );
  }
}
