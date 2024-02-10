import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget imageBorderCircle(context,height,width,{IconData? icon,String?image,bool?isimage=false,Color? color=Colors.black,bool?isborder=true})=>
    Container(
  height:isimage==true?height:MediaQuery.of(context).size.height / AppResponsiveHeigh.h40,
  width:isimage==true?width:MediaQuery.of(context).size.width /AppResponsiveWidth.w40 ,

  decoration: BoxDecoration(
    color: AppColors.white,shape:BoxShape.circle ,image: isimage==true?DecorationImage(image:AssetImage(image!) ):null,
    border: isborder==true?Border.all(
      color: Colors.black,
      width: 2.0,
    ):null,
  ),child:isimage==false?Center(child: Icon(icon,size: 30,color: color,)):null,

);