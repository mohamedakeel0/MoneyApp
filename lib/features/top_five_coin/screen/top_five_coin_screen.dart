import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/shared/default_app_bar.dart';
class TopFiveCoinScreen extends StatefulWidget {
  const TopFiveCoinScreen({Key? key}) : super(key: key);

  @override
  State<TopFiveCoinScreen> createState() => _TopFiveCoinScreenState();
}

class _TopFiveCoinScreenState extends State<TopFiveCoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   appBar:defaultAppBar(context,AppStrings.topFiveCoin,color: AppColors.colorPrimary,colorText:AppColors.white ) ,
    body:  SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height-100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0,top: 10.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
      
                return
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 2.0),
                    child: Container(
                      height:
                      MediaQuery.of(context).size.height / AppResponsiveHeigh.h70,
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
                                    heightImage: MediaQuery.of(context).size.height /
                                        AppResponsiveHeigh.h50,
                                    widthImage: MediaQuery.of(context).size.width /
                                        AppResponsiveWidth.w50,
                                    isImageWithRadius: true,
                                  ),
                                  SizedBox(width: 20,),
                                  Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    Text(
                                      'dolar',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppSize.s18,
                                        color: AppColors.black,
                                      ),
                                    ),
      
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height /
                                          AppResponsiveHeigh.h10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          '${AppStrings.buying} 71:12 ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: AppSize.s15,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Text(
                                          '${AppStrings.sell} 62:12 ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: AppSize.s15,
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
    ),);
  }
}
