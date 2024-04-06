import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget itemTopOnBoardingWidget(PageController boardController,context)=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 20.0),
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    TextButton(
        onPressed: () {
          boardController.previousPage(
              duration: Duration(milliseconds: 750),
              curve: Curves.fastLinearToSlowEaseIn);
        },
        child:  Text(
          AppStrings.back,
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript'),
        )),
    TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, Routes.loginRoute);
        },
        child:  Text(
          AppStrings.skip,
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript'),
        ))
  ],),
);