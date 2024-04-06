import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/icon_text_widget.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/image_border_circle.dart';

Widget itemReport(context,height,width,{String?firstName,String?secondName,IconData? icon})=>
    Padding(
      padding:  EdgeInsets.all(8.0.sp),
      child: Container(
        height: 90.h,
        width:width  ,
        decoration: BoxDecoration(
            color:AppColors.white,boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
            borderRadius: BorderRadius.circular(25.sp)
        ),child:  Padding(
        padding:   EdgeInsets.all(15.0.sp),
        child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Ali',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp
                  ,
                  color: AppColors.black,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 200.w,child:
                  FittedBox( fit: BoxFit.fitHeight,
                      child: iconTextWidget(color:AppColors.colorPrimary ,
                      text:firstName ,icon:Icons.location_on))),
                  Spacer(),
                  iconTextWidget(color:AppColors.redDark ,text: secondName ,icon:Icons.watch_later_outlined),
                  Spacer(),
                  GestureDetector(onTap: () {
                    Navigator.pushNamed(context, Routes.viewImageRoute,arguments: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt5sxD9d_AKu_UQWgmPcXnCEFJs8vT6ha0aw&usqp=CAU');
                  },
                    child: imageBorderCircle(context,40.h,
                        40.w,isimage: false
                        ,icon: icon ),
                  ),

                ],)

            ]),
      ),),
    );