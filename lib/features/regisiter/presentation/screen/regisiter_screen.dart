import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/features/login/presentation/widget/two_underline_text.dart';
import 'package:moneyapp/features/login/presentation/widget/under_line_text.dart';
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
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.signUpTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s25,
                        color: AppColors.black,
                      ),
                    ),
                    const Text(
                      AppStrings.titleRegisiter,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: AppSize.s16,
                        color: AppColors.grayMedium2,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          AppResponsiveHeigh.h35,
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 35.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildTextFormAndTitle(context,
                                    fristText: AppStrings.fristName,
                                    textEditingControllerFrist:
                                        cubic.fristNameController),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      AppResponsiveWidth.w20,
                                ),
                                buildTextFormAndTitle(context,
                                    fristText: AppStrings.lastName,
                                    textEditingControllerFrist:
                                        cubic.secondNameController),
                              ],
                            ),
                            const Text(
                              AppStrings.email,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: AppSize.s16,
                                color: AppColors.colorPrimaryDark,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h40,
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
                                iconSize: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h10,
                                isEnabled: true,
                                hintText: AppStrings.enterYourEmail,
                                isError: true,
                                isFocusBorder: true,
                                controller: cubic.emailController,
                                type: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {}
                                  return null;
                                },
                              ),
                            ),
                            const Text(
                              AppStrings.password,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: AppSize.s16,
                                color: AppColors.colorPrimaryDark,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h40,
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
                                iconSize: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h10,
                                isEnabled: true,
                                isError: true,
                                isFocusBorder: true,
                                controller: cubic.passwordController,
                                isPassword: true,
                                type: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {}
                                  return null;
                                },
                              ),
                            ),
                            const Text(
                              AppStrings.comfirmPassword,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: AppSize.s16,
                                color: AppColors.colorPrimaryDark,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h40,
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
                                iconSize: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h10,
                                isEnabled: true,
                                isError: true,
                                isFocusBorder: true,
                                controller: cubic.comfirmPasswordController,
                                isPassword: true,
                                type: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {}
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h10,
                            ),
                            const Center(
                              child: Text(
                                AppStrings.setYourPriorities,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppSize.s16,
                                  color: AppColors.colorPrimaryDark,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h20,
                            ),
                            Row(
                              children: [
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
                                          size: 20,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          AppResponsiveWidth.w2,
                                    ),
                                    Text(
                                      AppStrings.scanMoney,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppSize.s14,
                                        color: AppColors.gray2,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      AppResponsiveWidth.w2,
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
                                          size: 20,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          AppResponsiveWidth.w2,
                                    ),
                                    Text(
                                      AppStrings.checkYourArea,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppSize.s14,
                                        color: AppColors.gray2,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      AppResponsiveWidth.w2,
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
                                          size: 20,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          AppResponsiveWidth.w2,
                                    ),
                                    Text(
                                      AppStrings.exchangeHere,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppSize.s14,
                                        color: AppColors.gray2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h20,
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
                              height: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h20,
                            ),
                            Center(
                              child: defaultButton(
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
                                    Navigator.popAndPushNamed(
                                        context, Routes.doneRegisiterScreenRoute);
                                  },
                                  text: AppStrings.signUp,
                                  isUpperCase: false),
                            ),
                          ],
                        ),
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
