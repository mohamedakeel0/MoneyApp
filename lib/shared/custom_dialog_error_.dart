import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/services/app_navigator.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/shared/default_button.dart';

Future dialogErrorLogin(BuildContext context, {required String errorText}) {
  return showDialog(
    barrierDismissible: false,
    useSafeArea: false,
    context: context,
    builder: (_) {
      return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppConstance.ten)),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(AppConstance.ten)),
            ),
            height: 130.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppConstance.ten, horizontal: AppConstance.ten),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35.h,
                      child: Text(
                        '${AppStrings.currency} ${AppStrings.checker} ',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DancingScript'),
                      ),
                    ),
                    Text(
                      errorText,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.red,
                          fontSize: 17.sp,
                          fontFamily: 'DancingScript'),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultButton(
                            height: 35.h,
                            radius: AppConstance.twenty,
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'DancingScript',
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: false,
                            width: 80.w,
                            background: AppColors.colorPrimary,
                            context: context,
                            function: () {
Go.pop();
                            },
                            text: AppStrings.ok,
                            isUpperCase: false)

                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
    },
  );
}
