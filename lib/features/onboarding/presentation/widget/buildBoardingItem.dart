import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';


Widget buildBoardingItem(BoardingModel model, height, height15,width) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        )),
    Container(height: 2.h,width: width,color: AppColors.black),
    SizedBox(
      height: height,
    ),
    Text(
      '${model.title}',
      style:  TextStyle(fontWeight: FontWeight.bold,  fontSize: 15.sp,color:  AppColors.colorPrimary),
    ),
    SizedBox(
      height: height15,
    ),
    Text(
      '${model.body}',textAlign: TextAlign.center,
      style:   TextStyle(fontWeight: FontWeight.bold,   fontSize:15.sp ,color:  AppColors.black,),
    ),
    SizedBox(
      height: height15,
    ),

  ],
);