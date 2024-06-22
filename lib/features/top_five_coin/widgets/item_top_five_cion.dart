import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/shared/default_app_bar.dart';

Widget itemTopFiveCoin(context, List<TopFiveModel> topFive,
    {bool? isTopFive = true}) {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: SizedBox(
      height: MediaQuery.of(context).size.height - 100,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0.h, top: 10.0.h),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 2.0.h),
                child: Container(
                  height: 60.h,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildItemImageContiener(
                                context,
                                Colors.white,
                                topFive[index].image,
                                heightImage: 50.h,
                                widthImage: 50.w,
                                isImageWithRadius: true,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    topFive[index].title,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: AppStrings.buying,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '  ${topFive[index].buy}  ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      isTopFive == true
                                          ? SizedBox(
                                              width: 20.w,
                                            )
                                          : SizedBox.shrink(),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${isTopFive == true ? AppStrings.sell : AppStrings.marketValue}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' ${topFive[index].sell} ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                color: AppColors.colorPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.0,
              );
            },
            itemCount: topFive.length),
      ),
    ),
  );
}
