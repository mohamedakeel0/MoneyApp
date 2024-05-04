import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget buildUnderLineText({String? text})=>   Center(
  child: Text(
    text!,
    style:  TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      fontSize: 15.sp,
      color: AppColors.black,
    ),
  ),
);