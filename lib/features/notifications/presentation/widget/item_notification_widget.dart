import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';

Widget itemNotificationWidget(context,image){
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height:
      MediaQuery.of(context).size.height / AppResponsiveHeigh.h100,
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
        padding: EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      AppStrings.reprot,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s15,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '1 min ago ',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: AppSize.s15,
                      color: AppColors.grayMedium2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height /
                    AppResponsiveHeigh.h10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildItemImageContiener(
                    context,
                    Colors.white,
                    image,
                    heightImage: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h40,
                    widthImage: MediaQuery.of(context).size.width /
                        AppResponsiveWidth.w40,
                    isImageWithRadius: true,
                  ),
                  SizedBox(width: 20,),
                  FittedBox(
                    child: SizedBox(width: 250,height: 40,
                      child: const Text(maxLines: 2,
                        'Thank you for using the  application. you reported this place',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.s12,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
      ),
    ),
  );
}