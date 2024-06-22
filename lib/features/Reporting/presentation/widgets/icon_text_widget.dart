import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget iconTextWidget({IconData? icon, Color? color, String? text,bool?isLocation=false}) => Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 25.sp,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SizedBox(width:isLocation==true? 120.w:85.w,
            child: Text(
              text!,maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ],
    );
