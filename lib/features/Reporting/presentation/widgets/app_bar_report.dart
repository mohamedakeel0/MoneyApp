import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

PreferredSizeWidget appbarReport(context){
  return AppBar(foregroundColor:Colors.white,
      title:   const Text(
        AppStrings.previousReports,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppSize.s20,
          color: AppColors.black,
        ),
      ),centerTitle: true,backgroundColor: Colors.white,actions:  [

        GestureDetector( onTap: () {
          Navigator.pushNamed(context, Routes.notificationsRoute);
        },
          child: Padding(
          padding:  EdgeInsets.only(right: 20.0),
          child: Stack( alignment: AlignmentDirectional.topEnd,
            children: [
              const Icon(Icons.notifications_rounded,color: AppColors.gray2,size: 25),
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Container(decoration: const BoxDecoration(color:AppColors.red ,shape:BoxShape.circle ),height: 7,width: 7,),
              )
            ],
          ),
                ),
        )]);
}