

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

class SplashWidget extends StatefulWidget {
  bool?isChange;
   SplashWidget({
    this.isChange,
    super.key,
  });

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
  color: widget.isChange==true?AppColors.white :AppColors.colorPrimary,
      child: Padding(
        padding:  EdgeInsets.all(30.0.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: Image(
                image:widget.isChange==true?  AssetImage(ImageAssets.secondLogoApp):AssetImage(ImageAssets.logoApp),
                width: 105.w,
                height: 150.h,
              ),
            ),

            RichText(
              text:  TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.currency,
                    style: TextStyle(
                        fontSize: AppSize.s30, color:widget.isChange==true?   AppColors.black: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DancingScript'
                    ),

                  ),
                  TextSpan(
                      text: AppStrings.checker,
                    style: TextStyle(color:widget.isChange==true?   AppColors.colorPrimary:AppColors.black,
                        fontSize: AppSize.s30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DancingScript'
                    ),

                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
