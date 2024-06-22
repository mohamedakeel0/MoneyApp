import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_cubic.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_state.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:moneyapp/features/login/presentation/widget/two_underline_text.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:moneyapp/shared/default_form_field.dart';

class VarificationScreen extends StatefulWidget {
   VarificationScreen({Key? key, required this.email}) : super(key: key);
 String? email;
  @override
  State<VarificationScreen> createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {


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
        child: BlocConsumer<ForgetPasswordCubic, ForgetPasswordState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubic = ForgetPasswordCubic.get(context);
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 280.w,
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
                          height: 280.h,
                          width: MediaQuery.of(context).size.width,
                          image: const AssetImage(
                            ImageAssets.varification,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h300,
                        decoration: const BoxDecoration(
                            color: AppColors.backGroundPrimary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(AppSize.s30),
                                topLeft: Radius.circular(AppSize.s30))),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: 25.0.h, horizontal: 30.0.w),
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
                                  cubic.changeCode(value);
                                },
                                onEditing: (bool value) {},
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              cubic.codeEnter != cubic.forgetPasswordEntity!.email
                                  ? Text(
                                AppStrings.enterYourCode,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: 'DancingScript',
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                                  : SizedBox(),
                              SizedBox(
                                height: 35.h,
                              ),
                              Center(
                                child:cubic.codeState !=
                                    RequestState.loading
                                    ? defaultButton(
                                    height: 40.h,
                                    radius: AppConstance.ten,
                                    textStyle: const TextStyle(
                                      fontSize: FontSize.s16,
                                      fontFamily: 'DancingScript',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    shape: false,
                                    width: 220.w
                                    ,
                                    background: AppColors.colorPrimary,
                                    context: context,
                                    function: () {
                                      cubic.code(context, cubic.codeEnter,widget.email!);

                                    },
                                    text: AppStrings.verify,
                                    isUpperCase: false):CircularProgressIndicator(),
                              ),
                              SizedBox(
                                height: 45.h,
                              ),
                              GestureDetector(
                                child: twoTextWithUnderline(
                                    fristText: AppStrings.didReceived,
                                    secondText: AppStrings.resend),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            );
          }
        ),
      ),
    );
  }
}
