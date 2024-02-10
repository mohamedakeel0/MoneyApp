import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/features/notifications/presentation/widget/item_notification_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          AppStrings.notifications,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppStrings.today,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s25,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height-480,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListView.separated(physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {

                      return
                        itemNotificationWidget(context, ImageNotifi[index]);
                    },
                    separatorBuilder: (context, index) {
                      return   SizedBox(height: 0.0,);
                    },
                    itemCount: 3),
              ),
            ),

            Text(
              AppStrings.yesterday,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s25,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height-480,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListView.separated(physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {

                      return
                        itemNotificationWidget(context, ImageNotifi[index]);
                    },
                    separatorBuilder: (context, index) {
                      return   SizedBox(height: 0.0,);
                    },
                    itemCount: 3),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
