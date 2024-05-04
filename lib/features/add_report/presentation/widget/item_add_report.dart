import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget itemAddReport(context,text,icon)=>Container(
  width: MediaQuery.of(context).size.width / AppResponsiveWidth.w270,
  height: MediaQuery.of(context).size.height / AppResponsiveHeigh.h80,
  decoration: BoxDecoration(
      color: AppColors.colorPrimary,
      borderRadius: BorderRadius.circular(AppSize.s16)),
  child: Padding(
    padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
    child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppSize.s20,
          color: AppColors.white,
        ),
      ),
      const Spacer(),
      Icon(
        icon,
        size: 40,
      )
    ]),
  ),
);