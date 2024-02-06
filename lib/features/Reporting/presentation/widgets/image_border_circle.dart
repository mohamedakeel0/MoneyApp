import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget imageBorderCircle(context,height,width,{IconData? icon})=>Container(
  height: MediaQuery.of(context).size.height / AppResponsiveHeigh.h40,
  width:MediaQuery.of(context).size.width /AppResponsiveWidth.w40 ,

  decoration: BoxDecoration(
    color: AppColors.white,shape:BoxShape.circle ,
    border: Border.all(
      color: Colors.black,
      width: 2.0,
    ),
  ),child:Icon(icon,size: 30,),

);