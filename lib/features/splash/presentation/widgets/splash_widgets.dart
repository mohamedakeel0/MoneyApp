

import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: Image(
                image:widget.isChange==true?  AssetImage(ImageAssets.secondLogoApp):AssetImage(ImageAssets.logoApp),
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.height/AppResponsiveHeigh.h150,
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
