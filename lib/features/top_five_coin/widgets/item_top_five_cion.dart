import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/shared/default_app_bar.dart';
Widget itemTopFiveCoin(context){
  return  SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: SizedBox(
      height: MediaQuery.of(context).size.height-100,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 8.0.h,top: 10.0.h),
        child: ListView.separated(
            itemBuilder: (context, index) {

              return
                Padding(
                  padding:  EdgeInsets.only(
                      left: 25.0.w,right: 25.0.w,bottom: 2.0.h),
                  child: Container(
                    height:
                    60.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildItemImageContiener(
                                  context,
                                  Colors.white,
                                  ImageAssets.dolar,
                                  heightImage: 50.h,
                                  widthImage: 50.w,
                                  isImageWithRadius: true,
                                ),
                                SizedBox(width: 20.w,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Text(
                                    'dolar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: AppColors.black,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                   Row(
                                    children: [
                                      Text(
                                        '${AppStrings.buying} 71:12 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(width: 20.w,),
                                      Text(
                                        '${AppStrings.sell} 62:12 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],),

                              ],
                            )
                          ]),
                    ),
                  ),
                );
            },
            separatorBuilder: (context, index) {
              return   SizedBox(height: 20.0,);
            },
            itemCount: 10),
      ),
    ),
  );
}