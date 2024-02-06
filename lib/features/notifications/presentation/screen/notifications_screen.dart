import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor:Colors.white,  title:   const Text(
      AppStrings.notifications,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppSize.s25,
        color: AppColors.black,
      ),
    ),
        centerTitle: true,backgroundColor: Colors.white,leading: IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),),body: Column(children: [


    ]),);
  }
}
