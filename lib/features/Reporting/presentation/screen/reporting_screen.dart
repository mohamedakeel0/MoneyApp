import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';

import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/services/services_locator.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
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
      create: (context) => sl<ReportingCubic>(),
      child: BlocConsumer<ReportingCubic, ReportingState>(
        builder: (context, state) {
          var cubic = ReportingCubic.get(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: appbarReport(context),
            body: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width-25) / 2,
                        height: MediaQuery.of(context).size.height /
                            AppResponsiveHeigh.h40,
                        child: defaultFormField(
                          context: context,
                          onTap: () {},
                          prefixIsImage: false,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          prefix: Icons.search,
                          iconSize: MediaQuery.of(context).size.height /
                              AppResponsiveHeigh.h10,
                          isEnabled: true,
                          hintText: AppStrings.search,
                          isError: true,
                          myfocusborder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: AppColors.colorPrimary,
                              width: 2.0,
                            ),
                          ),
                          isFocusBorder: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
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
                          height: MediaQuery.of(context).size.height /
                              AppResponsiveHeigh.h40,
                          radius: AppConstance.twentyFive,
                          textStyle: const TextStyle(
                            fontSize: FontSize.s16,
                            fontFamily: 'DancingScript',
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          shape: false,
                          width: (MediaQuery.of(context).size.width-25) /
                              2,
                          background: AppColors.colorPrimary,
                          context: context,
                          function: () {},
                          text: AppStrings.addReport,
                          isUpperCase: false),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height-100,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) {

                          return
                            itemReport(
                                context,MediaQuery.of(context).size.height,
                                MediaQuery.of(context).size.width,
                                secondName:'11:55' ,firstName:'sammnoud , elgarbiy , eygpt'  ,
                                icon: Icons.image );
                        },
                        separatorBuilder: (context, index) {
                          return   SizedBox(height: 1,);
                        },
                        itemCount: 10),
                  ),
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
