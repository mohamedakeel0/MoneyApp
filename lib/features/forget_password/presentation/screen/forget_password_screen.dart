import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return BlocConsumer<ForgetPasswordCubic, ForgetPasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubic = ForgetPasswordCubic.get(context);
        return Scaffold(appBar:
        AppBar(
          title:  const Text(
          AppStrings.forgetPassword,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s25,
            color: AppColors.black,
          ),
        ),centerTitle: true,backgroundColor: Colors.white,),
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(   width: MediaQuery.of(context).size.width /
                          AppResponsiveWidth.w325,
                        child: const Text(
                          AppStrings.titleForget,textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: AppSize.s16,
                            color: AppColors.grayMedium2,
                          ),
                        ),
                      ),

                      Center(
                        child: Image(height: MediaQuery.of(context).size.height /
                            AppResponsiveHeigh.h336,width: MediaQuery.of(context).size.width ,
                          image: const AssetImage(ImageAssets.forgotpassword,),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height /
                            AppResponsiveHeigh.h327,
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
                              const Text(
                                AppStrings.email,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: AppSize.s16,
                                  color: AppColors.colorPrimaryDark,
                                ),
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
                                  isEnabled: true,hintText: AppStrings.enterYourEmail,
                                  isError: true,
                                  isFocusBorder: true,
                                  controller: cubic.emailController,
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
                                    AppResponsiveHeigh.h20,
                              ),
                              defaultButton(
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
                                    Navigator.pushNamed(context, Routes.varificationRoute);
                                  },
                                  text: AppStrings.sendCode,
                                  isUpperCase: false),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h40,
                              ),
                              GestureDetector(child: twoTextWithUnderline(fristText: AppStrings.rememberPassword,secondText: AppStrings.loginNow ),onTap: () {
                                Navigator.pushReplacementNamed(context, Routes.loginRoute);
                              },),

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
