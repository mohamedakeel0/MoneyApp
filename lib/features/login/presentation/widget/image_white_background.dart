import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget buildItemImageContiener(context,color,image)=> Container(
  width: MediaQuery.of(context).size.width /
      AppResponsiveWidth.w95,
  height: MediaQuery.of(context).size.height /
      AppResponsiveHeigh.h50,
  decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s15))),
  child: Center(
    child: Image(height: MediaQuery.of(context).size.height /
        AppResponsiveHeigh.h25,width: MediaQuery.of(context).size.width /
        AppResponsiveWidth.w25,
      image: AssetImage(image,),
    ),
  ),
);