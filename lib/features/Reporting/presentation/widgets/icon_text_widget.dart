import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget iconTextWidget({IconData? icon,Color? color,String? text})=>  Row(children: [
  Icon(icon,color: color,size: 25,),
  Text(
    text!,
    textAlign: TextAlign.start,
    style: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppSize.s16
      ,
      color: AppColors.black,
    ),
  ),

],);