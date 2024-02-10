import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/onboarding/presentation/screen/on_boarding_screen.dart';

List<BoardingModel> boarding = [
  BoardingModel(
    image: ImageAssets.onboarding2,
    title: AppStrings.title1,
    body:  AppStrings.body1,),
  BoardingModel(
    image: ImageAssets.onboarding1,

    title: AppStrings.title2,
    body:  AppStrings.body2,),
  BoardingModel(
    image: ImageAssets.onboarding3,
    title: AppStrings.title3,
    body:  AppStrings.body3,),
];
class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}
List ImageNotifi=[
  ImageAssets.notifi1,
  ImageAssets.information,
  ImageAssets.receipt,
];
List<BoardingModel> moreList = [
  BoardingModel(
    image: ImageAssets.profile,
    title: AppStrings.profile,
    body:  AppStrings.body1,),
  BoardingModel(
    image: ImageAssets.epSetting,

    title: AppStrings.setting,
    body:  AppStrings.body2,),
  BoardingModel(
    image: ImageAssets.chartEvaluation,
    title: AppStrings.topFiveCoin,
    body:  AppStrings.body3,),
  BoardingModel(
    image: ImageAssets.currency,
    title: AppStrings.digitalCurrency,
    body:  AppStrings.body3,),
  BoardingModel(
    image: ImageAssets.lock,
    title: AppStrings.privacyPolicy,
    body:  AppStrings.body3,),
  BoardingModel(
    image: ImageAssets.help,
    title: AppStrings.help,
    body:  AppStrings.body3,),
  BoardingModel(
    image: ImageAssets.logout,
    title: AppStrings.logOut,
    body:  AppStrings.body3,),
];