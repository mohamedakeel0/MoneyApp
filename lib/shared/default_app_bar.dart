import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

PreferredSizeWidget defaultAppBar(context,text,{Color color=Colors.white,Color colorText=Colors.black})=>AppBar(
  foregroundColor: color,
  title:  Text(
    text,
    style:  TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      color: colorText,
    ),
  ),
  centerTitle: true,
  backgroundColor:color,
  leading: IconButton(
    icon:  Icon(Icons.arrow_back, color: colorText),
    onPressed: () => Navigator.of(context).pop(),
  ),
);