import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      foregroundColor: Colors.white,
      title: const Text(
        AppStrings.privacyPolicy,
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
        Text(
          '1. Types data we collect',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s20,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/ AppResponsiveHeigh.h10),
        SizedBox(height:MediaQuery.of(context).size.height-400 ,width: MediaQuery.of(context).size.width,

          child:  Text(
         'aaaaaaasasdasasdasdas sadasdsadffdasdfsadfasd  sadfasdf sadf sadf asdf sdaf sdaf sadf sadfsadf sadf sadf asd fasd fsad fasdf asd fasd fdsaf asdf sd fdsa fasdf sda fads fas dsa fsdf sdf dsf sdf sda fsd fsdf sd fsad fsdfa sdaf sd fdsa fsdf dsaf sad fsd sda',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: AppSize.s18,
            color: AppColors.black,
          ),
        ),)
      ]),
    ),);
  }
}
