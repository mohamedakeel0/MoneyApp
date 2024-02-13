import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/app_bar_report.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: AppColors.white,
      appBar: AppBar(foregroundColor:Colors.white,
        title:   const Text(
          AppStrings.more,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.s20,
            color: AppColors.black,
          ),
        ),centerTitle: true,backgroundColor: Colors.white,),body:
      Column(
        children: [
          SizedBox(height:  MediaQuery.of(context).size.height-190,
            child: ListView.separated(
                itemCount: moreList.length,separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Image(height: MediaQuery.of(context).size.height/ AppResponsiveHeigh.h30,
                          width: MediaQuery.of(context).size.width/AppResponsiveWidth.w30,
                          image: AssetImage(moreList[index].image),
                        ),
                          title:Text(
                        moreList[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: AppSize.s18,
                          color: AppColors.black,
                        ),
                      ),onTap: () {
                          if(index==6){
                            Navigator.pushReplacementNamed(context, moreList[index].body);
                          }else{
                            Navigator.pushNamed(context, moreList[index].body);
                          }

                      },

                      ),
                      Container(height: 1,width: MediaQuery.of(context).size.width-50,color: AppColors.graySoft),
                    ],
                  );
                },
              ),
          ),
        ],
      ),);
  }
}
