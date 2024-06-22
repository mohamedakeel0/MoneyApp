import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';

import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/services/services_locator.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/Reporting/presentation/manager/reporting_cubic.dart';
import 'package:moneyapp/features/Reporting/presentation/manager/reporting_state.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/app_bar_report.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/icon_text_widget.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/image_border_circle.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/item_report.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:moneyapp/shared/default_form_field.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ReportingCubic>()..report(),
      child: BlocConsumer<ReportingCubic, ReportingState>(
        builder: (context, state) {
          var cubic = ReportingCubic.get(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: appbarReport(context),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 25) / 2,
                        height: 35.h,
                        child: defaultFormField(
                          context: context,
                          onTap: () {},
                          change: (value) {
                            if (value.toString().isNotEmpty) {
                              cubic.updateFilteredReports(value);
                            } else {
                              cubic.report();
                            }
                          },
                          prefixIsImage: false,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          prefix: Icons.search,
                          iconSize: 10.sp,
                          isEnabled: true,
                          hintText: AppStrings.search,
                          isError: true,
                          myfocusborder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0.sp),
                            borderSide: BorderSide(
                              color: AppColors.colorPrimary,
                              width: 2.0.sp,
                            ),
                          ),
                          isFocusBorder: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0.sp),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0.w,
                            ),
                          ),
                          controller: cubic.reportingController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {}
                            return null;
                          },
                        ),
                      ),
                      const Spacer(),
                      defaultButton(
                          height: 35.h,
                          radius: AppConstance.twentyFive,
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'DancingScript',
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          shape: false,
                          width: (MediaQuery.of(context).size.width - 25) / 2,
                          background: AppColors.colorPrimary,
                          context: context,
                          function: () {
                            Navigator.pushNamed(context, Routes.addReportRoute);
                          },
                          text: AppStrings.addReport,
                          isUpperCase: false),
                    ],
                  ),
                ),
                cubic.addReportState != RequestState.loading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return itemReport(
                                    context,
                                    MediaQuery.of(context).size.height,
                                    MediaQuery.of(context).size.width,
                                    name: cubic.reports![index].name,
                                    underSecondName:
                                        '${cubic.reports![index].dateTime!.day}-${cubic.reports![index].dateTime!.month}-${cubic.reports![index].dateTime!.year}',
                                    secondName:
                                        '${cubic.reports![index].dateTime!.hour}:${cubic.reports![index].dateTime!.minute}',
                                    firstName: cubic.reports![index].location,
                                    icon: Icons.image);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 1.h,
                                );
                              },
                              itemCount: cubic.reports!.length),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 200.h),
                        child: const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.colorPrimary,
                        )),
                      ),
              ]),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
