import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/add_report/presentation/widget/item_add_report.dart';
import 'package:moneyapp/shared/default_app_bar.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context,AppStrings.addReport,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width / AppResponsiveWidth.w270))/2),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
          itemAddReport(context,AppStrings.insertImage,Icons.image_outlined),
          SizedBox(height: MediaQuery.of(context).size.height / AppResponsiveHeigh.h50,),
          itemAddReport(context,AppStrings.addLocation,Icons.add_location_alt_outlined),

        ]),
      ),
    );
  }
}
