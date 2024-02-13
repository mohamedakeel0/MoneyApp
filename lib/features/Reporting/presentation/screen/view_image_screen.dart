import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/features/notifications/presentation/widget/item_notification_widget.dart';

class ViewImageScreen extends StatefulWidget {
  String image;
   ViewImageScreen({ required this.image,Key? key}) : super(key: key);

  @override
  State<ViewImageScreen> createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          AppStrings.viewImage,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / AppResponsiveHeigh.h200),
          child: Container(width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height / AppResponsiveHeigh.h250,
          decoration:  BoxDecoration(
          image:  DecorationImage(
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt5sxD9d_AKu_UQWgmPcXnCEFJs8vT6ha0aw&usqp=CAU',),
          fit: BoxFit.fill,
                )
              )
              ),
        ),


        ]),
      ),
    );
  }
}