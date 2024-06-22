import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/features/top_five_coin/widgets/item_top_five_cion.dart';
import 'package:moneyapp/shared/default_app_bar.dart';

class DigitalCurrencyScreen extends StatefulWidget {
  const DigitalCurrencyScreen({Key? key}) : super(key: key);

  @override
  State<DigitalCurrencyScreen> createState() => _DigitalCurrencyScreenState();
}

class _DigitalCurrencyScreenState extends State<DigitalCurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, AppStrings.digitalCurrency,
          color: AppColors.colorPrimary, colorText: AppColors.white),
      body: itemTopFiveCoin(context, list2, isTopFive: false),
    );
  }
}
