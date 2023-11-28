import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget buildUnderLineText({String? text})=>   Center(
  child: Text(
    text!,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      fontSize: AppSize.s15,
      color: AppColors.black,
    ),
  ),
);