import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';

import 'package:moneyapp/core/resources/values_manager.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor:  AppColors.white,appBar:
    AppBar(foregroundColor:Colors.white,
      title:   const Text(
        AppStrings.forgetPassword,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppSize.s25,
          color: AppColors.black,
        ),
      ),centerTitle: true,backgroundColor: Colors.white,),);
  }
}
