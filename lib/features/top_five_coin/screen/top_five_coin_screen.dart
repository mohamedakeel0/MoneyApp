import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/login/presentation/widget/image_white_background.dart';
import 'package:moneyapp/features/top_five_coin/widgets/item_top_five_cion.dart';
import 'package:moneyapp/shared/default_app_bar.dart';

class TopFiveCoinScreen extends StatefulWidget {
  const TopFiveCoinScreen({Key? key}) : super(key: key);

  @override
  State<TopFiveCoinScreen> createState() => _TopFiveCoinScreenState();
}

class _TopFiveCoinScreenState extends State<TopFiveCoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, AppStrings.topFiveCoin,
          color: AppColors.colorPrimary, colorText: AppColors.white),
      body: itemTopFiveCoin(context, list, isTopFive: true),
    );
  }
}
