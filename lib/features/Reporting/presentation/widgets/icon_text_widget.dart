import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget iconTextWidget({IconData? icon,Color? color,String? text})=>  Row(children: [
  Icon(icon,color: color,size: 25.sp,),
  Text(
    text!,
    textAlign: TextAlign.start,
    style:  TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp
      ,
      color: AppColors.black,
    ),
  ),

],);