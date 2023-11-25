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