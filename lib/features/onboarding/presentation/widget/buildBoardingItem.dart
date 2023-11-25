import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';


Widget buildBoardingItem(BoardingModel model, height, height15) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        )),
    SizedBox(
      height: height,
    ),
    Text(
      '${model.title}',
      style: const TextStyle(fontWeight: FontWeight.bold,  fontSize: AppSize.s20,color:  AppColors.colorPrimary),
    ),
    SizedBox(
      height: height15,
    ),
    Text(
      '${model.body}',textAlign: TextAlign.center,
      style:  const TextStyle(fontWeight: FontWeight.bold,   fontSize: AppSize.s15,color:  AppColors.black,),
    ),
    SizedBox(
      height: height15,
    ),
  ],
);