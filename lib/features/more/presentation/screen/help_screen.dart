import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          AppStrings.help,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s20,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

        SizedBox(height: MediaQuery.of(context).size.height/ AppResponsiveHeigh.h10),
        SizedBox(height:MediaQuery.of(context).size.height-200 ,width: MediaQuery.of(context).size.width,

          child:  Text(AppStrings.description,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: AppSize.s18,
              color: AppColors.black,
            ),
          ),),

      ]),
    ),);
  }
}
