import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget buildItemImageContiener(context,color,image,{bool? isImageWithRadius,double? widthImage,double? heightImage})=> Container(
  width:isImageWithRadius==true? null:MediaQuery.of(context).size.width /
      AppResponsiveWidth.w95,
  height:isImageWithRadius==true? null: MediaQuery.of(context).size.height /
      AppResponsiveHeigh.h50,clipBehavior: Clip.antiAliasWithSaveLayer,
  decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s15))),
  child: Center(
    child: Image(height: heightImage,width: widthImage,
      image: AssetImage(image,),
    ),
  ),
);