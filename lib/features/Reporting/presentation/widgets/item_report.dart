import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/icon_text_widget.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/image_border_circle.dart';

Widget itemReport(context, height, width,
        {String? firstName,
        String? secondName,
        IconData? icon,
        String? name,
        String? underSecondName}) =>
    Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Container(
        height: 95.h,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
            borderRadius: BorderRadius.circular(25.sp)),
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColors.black,
                      ),
                    ),
                    iconTextWidget(isLocation: false,
                        color: AppColors.redDark,
                        text: underSecondName,
                        icon: Icons.date_range_outlined),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconTextWidget(
                        color: AppColors.colorPrimary,
                        text: firstName,isLocation: true,
                        icon: Icons.location_on),
                    iconTextWidget(
                        color: AppColors.redDark,isLocation: false,
                        text: secondName,
                        icon: Icons.watch_later_outlined),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.viewImageRoute,arguments: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt5sxD9d_AKu_UQWgmPcXnCEFJs8vT6ha0aw&usqp=CAU');
                      },
                      child: imageBorderCircle(context, 40.h, 40.w,
                          isimage: false, icon: icon),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
