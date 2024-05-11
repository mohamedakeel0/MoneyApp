import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/services/app_navigator.dart';
import 'package:moneyapp/core/services/services_locator.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_cubic.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_state.dart';
import 'package:moneyapp/features/add_report/presentation/widget/item_add_report.dart';
import 'package:moneyapp/features/camera/presentation/bloc/add_image_cubic.dart';
import 'package:moneyapp/features/camera/presentation/bloc/add_image_state.dart';
class AddImageScreen extends StatelessWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddImageCubic, AddImageState>(
      builder: (context, state) {
        var cubic = AddImageCubic.get(context);
        return Scaffold(

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
                        cubic.captureImage(context);

                      },
                      child: itemAddReport(context, AppStrings.insertImage,
                          Icons.image_outlined)),

                ]),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
