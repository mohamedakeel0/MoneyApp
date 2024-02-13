import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
class AddReportScreen extends StatefulWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      foregroundColor: Colors.white,
      title: const Text(
        AppStrings.addReport,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppSize.s20,
          color: AppColors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ),);
  }
}
