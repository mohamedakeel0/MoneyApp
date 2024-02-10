import 'package:flutter/cupertino.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget twoTextWithUnderline({String? fristText,String? secondText})=> Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      fristText!,
      style: TextStyle(
        fontWeight: FontWeight.w300,

        fontSize: AppSize.s14,
        color: AppColors.gray2,
      ),
    ),
    Text(
      secondText!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        fontSize: AppSize.s15,
        color: AppColors.black,
      ),
    ),
  ],);