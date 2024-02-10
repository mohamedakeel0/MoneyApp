import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/icon_text_widget.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/image_border_circle.dart';

Widget itemReport(context,height,width,{String?firstName,String?secondName,IconData? icon})=>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height / AppResponsiveHeigh.h110,
        width:width  ,
        decoration: BoxDecoration(
            color:AppColors.white,boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
            borderRadius: BorderRadius.circular(25)
        ),child:  Padding(
        padding:  const EdgeInsets.all(15.0),
        child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ali',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.s18
                  ,
                  color: AppColors.black,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: width/AppResponsiveWidth.w220,child:
                  FittedBox( fit: BoxFit.fitHeight,child: iconTextWidget(color:AppColors.colorPrimary ,
                      text:firstName ,icon:Icons.location_on))),
                  Spacer(),
                  iconTextWidget(color:AppColors.redDark ,text: secondName ,icon:Icons.watch_later_outlined),
                  Spacer(),
                  GestureDetector(onTap: () {
                    Navigator.pushNamed(context, Routes.viewImageRoute,arguments: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt5sxD9d_AKu_UQWgmPcXnCEFJs8vT6ha0aw&usqp=CAU');
                  },
                    child: imageBorderCircle(context,height/ AppResponsiveHeigh.h40,
                        width/AppResponsiveWidth.w40,isimage: false
                        ,icon: icon ),
                  ),

                ],)

            ]),
      ),),
    );