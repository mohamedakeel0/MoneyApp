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
        SizedBox(height:MediaQuery.of(context).size.height-560 ,width: MediaQuery.of(context).size.width,

          child:  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: AppSize.s18,
            color: AppColors.black,
          ),
        ),),
        Text(
          '2. Use of your personal data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s20,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/ AppResponsiveHeigh.h10),

        SizedBox(height:MediaQuery.of(context).size.height-560 ,width: MediaQuery.of(context).size.width,

          child:  Text(
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
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
