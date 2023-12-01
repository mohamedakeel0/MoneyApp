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

class DoneRegisiterScreen extends StatefulWidget {
  const DoneRegisiterScreen({Key? key}) : super(key: key);

  @override
  State<DoneRegisiterScreen> createState() => _DoneRegisiterScreenState();
}

class _DoneRegisiterScreenState extends State<DoneRegisiterScreen> {
  var code;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(

      backgroundColor: AppColors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Stack(alignment: AlignmentDirectional.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          AppResponsiveHeigh.h40,
                    ),
                    Center(
                      child: Image(
                        height: MediaQuery.of(context).size.height /
                            AppResponsiveHeigh.h350,
                        width: MediaQuery.of(context).size.width,
                        image: const AssetImage(
                          ImageAssets.doneRegisiter,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Image(fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height /
                            AppResponsiveHeigh.h350,
                        width: MediaQuery.of(context).size.width,
                        image: const AssetImage(
                          ImageAssets.backgroundDoneRegisiter,
                        ),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Container(     width: MediaQuery.of(context).size.width-100,
                  height: MediaQuery.of(context).size.height /
                      AppResponsiveHeigh.h280,
                  decoration: const BoxDecoration(
                      color: AppColors.colorPrimary,
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s30),
                        )),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children:  [

                  const Text(
                    AppStrings.accountCreate,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s20,
                      color: AppColors.white,
                    ),

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h20,
                  ),
                  const Text(
                    AppStrings.accountCreateTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: AppSize.s16,
                      color: AppColors.white,
                    ),

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h20,
                  ),
                  const Text(
                    AppStrings.accountCreateTitleSecond,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: AppSize.s16,
                      color: AppColors.white,
                    ),

                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h20,
                  ),
                  defaultButton(
                      height: MediaQuery.of(context).size.height /
                          AppResponsiveHeigh.h40,
                      radius: AppConstance.ten,
                      textStyle: const TextStyle(
                        fontSize: FontSize.s16,
                        fontFamily: 'DancingScript',
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      shape: false,
                      width: MediaQuery.of(context).size.width /
                          AppResponsiveWidth.w150,
                      background: AppColors.white,
                      context: context,
                      function: () {

                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      text: AppStrings.goToLoin,
                      isUpperCase: false),
                ]),



                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
