import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/image_border_circle.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.colorPrimary,
      appBar: AppBar(

      title: const Text(
        AppStrings.profileMor,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppSize.s20,
          color: AppColors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: AppColors.colorPrimary,
      leading: IconButton(
        icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),actions:  [

        GestureDetector( onTap: () {

    },
      child: const Padding(
        padding:  EdgeInsets.only(right: 20.0),
        child:Text(
          AppStrings.save,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s15,
            color: AppColors.black,
          ),
        ),
      ),
    )]
    ),
body: Center(
  child: Column(children: [
    Stack(alignment: AlignmentDirectional.bottomEnd,
      children: [
      imageBorderCircle(context,MediaQuery.of(context).size.height/ AppResponsiveHeigh.h140,
          MediaQuery.of(context).size.width/AppResponsiveWidth.w140
          ,isimage: true,image: ImageAssets.person),
     imageBorderCircle(context,MediaQuery.of(context).size.height/ AppResponsiveHeigh.h30,
          MediaQuery.of(context).size.width/AppResponsiveWidth.w30,isborder: false,color: AppColors.colorPrimary
          ,isimage: false,icon: Icons.camera_alt_outlined),
    ],),

    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 190,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.s30),
              topLeft: Radius.circular(AppSize.s30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children:  [


        ],),
      ),
    )
  ]),
),
    );
  }
}
