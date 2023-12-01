import 'package:flutter/material.dart';
import 'package:moneyapp/core/network/cache_helper.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/onboarding/presentation/widget/buildBoardingItem.dart';
import 'package:moneyapp/features/onboarding/presentation/widget/top_on_boarding_widget.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardController = PageController();

  bool islast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    )!.then((value)
    {
      if (value) {
        Navigator.popAndPushNamed(context, Routes.loginRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(height / 27.5),
        child: Column(
          children: [
            itemTopOnBoardingWidget(boardController,context),

            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      islast = true;
                    });
                  } else {
                    setState(() {
                      islast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) => buildBoardingItem(
                    boarding[index], height / 27.5, height / 55.03,width),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: height / AppResponsiveHeigh.h10,
            ),

            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor:  AppColors.colorPrimary,
                dotHeight: 10,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5,
              ),
            ),
            SizedBox(
              height: height / AppResponsiveHeigh.h25,
            ),
            defaultButton(
                height:
                MediaQuery.of(context)
                    .size
                    .height /
                    AppResponsiveHeigh
                        .h40,
                radius: AppConstance
                    .thirtyPointFive,
                textStyle: const TextStyle(
                  fontSize: FontSize.s16,
                  fontFamily:
                  'DancingScript',
                  color: AppColors.white,
                  fontWeight:
                  FontWeight.w400,
                ),
                shape: false,
                width:
                MediaQuery.of(context)
                    .size
                    .width /
                    AppResponsiveWidth
                        .w300,
                background: AppColors.colorPrimary,
                context: context,
                function: () {
                  if(islast){submit();}
                  else {
                    boardController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);

                  }
                },
                text: islast?AppStrings.getStart:AppStrings.next,
                isUpperCase: false),
          ],
        ),
      ),
    );
  }


}


