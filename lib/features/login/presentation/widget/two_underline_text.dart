import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget twoTextWithUnderline({String? fristText,String? secondText})=>
    Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      fristText!,
      style: TextStyle(
        fontWeight: FontWeight.w300,

        fontSize: 14.sp,
        color: AppColors.gray2,
      ),
    ),
    Text(
      secondText!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        fontSize: 15.sp,
        color: AppColors.black,
      ),
    ),
  ],);