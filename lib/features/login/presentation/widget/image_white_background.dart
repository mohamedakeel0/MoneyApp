import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget buildItemImageContiener(context, color, image,
        {bool? isImageWithRadius, double? widthImage, double? heightImage}) =>
    Container(
      width: isImageWithRadius == true ? null : 70.w,
      height: isImageWithRadius == true ? null : 50.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s15))),
      child: Center(
        child: Image(
          height: heightImage,
          width: widthImage,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
