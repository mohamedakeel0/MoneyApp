import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/services/services_locator.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_cubic.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_state.dart';
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
    return BlocProvider(
      create: (context) => sl<AddReportingCubic>()..determinePosition(context),
      child: BlocConsumer<AddReportingCubic, AddReportingState>(
        builder: (context, state) {
          var cubic = AddReportingCubic.get(context);
          return Scaffold(
            appBar: defaultAppBar(
              context,
              AppStrings.addReport,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (MediaQuery.of(context).size.width -
                          (MediaQuery.of(context).size.width /
                              AppResponsiveWidth.w270)) /
                      2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          cubic.uploadImage();
                        },
                        child: itemAddReport(context, AppStrings.insertImage,
                            Icons.image_outlined)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height /
                          AppResponsiveHeigh.h50,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.mapRoute,arguments: MapModel(
                              comeFrom: AppStrings.currency,
                              lat:  cubic.lat,
                              lon: cubic.lon));
                        },
                        child: itemAddReport(context, AppStrings.addLocation,
                            Icons.add_location_alt_outlined)),
                  ]),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
