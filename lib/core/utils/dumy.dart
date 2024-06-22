import 'dart:convert';

import 'package:moneyapp/core/network/cache_helper.dart';
import 'package:moneyapp/core/network/cache_helper_keys.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/login/data/models/loginModel.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/onboarding/presentation/screen/on_boarding_screen.dart';

List<BoardingModel> boarding = [
  BoardingModel(
    image: ImageAssets.onboarding2,
    title: AppStrings.title1,
    body: AppStrings.body1,
  ),
  BoardingModel(
    image: ImageAssets.onboarding1,
    title: AppStrings.title2,
    body: AppStrings.body2,
  ),
  BoardingModel(
    image: ImageAssets.onboarding3,
    title: AppStrings.title3,
    body: AppStrings.body3,
  ),
];

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

List ImageNotifi = [
  ImageAssets.notifi1,
  ImageAssets.information,
  ImageAssets.receipt,
];
List<BoardingModel> moreList = [
  BoardingModel(
    image: ImageAssets.profile,
    title: AppStrings.profile,
    body: Routes.profileRoute,
  ),
  BoardingModel(
    image: ImageAssets.chartEvaluation,
    title: AppStrings.topFiveCoin,
    body: Routes.topFiveCoinRoute,
  ),
  BoardingModel(
    image: ImageAssets.currency,
    title: AppStrings.digitalCurrency,
    body: Routes.digitalCurrencyRoute,
  ),
  BoardingModel(
    image: ImageAssets.lock,
    title: AppStrings.privacyPolicy,
    body: Routes.privacyPolicyRoute,
  ),
  BoardingModel(
      image: ImageAssets.help,
      title: AppStrings.help,
      body: Routes.helpRoute),
  BoardingModel(
    image: ImageAssets.logout,
    title: AppStrings.logOut,
    body: Routes.loginRoute,
  ),
];

class TopFiveModel {
  final String image;
  final String title;
  final String buy;
  final String sell;

  TopFiveModel({
    required this.image,
    required this.title,
    required this.buy,
    required this.sell,
  });
}

class MapModel {
  String? comeFrom;
  double? lat;
  double? lon;

  MapModel({this.comeFrom, this.lat, this.lon});
}

void savaDataUser(LoginEntity loginEntity) {
  CacheHelper.saveData(
      key: CacheStorageKeys.userInformation,
      value: jsonEncode(loginEntity.toJson()));
  CacheHelper.saveData(key: CacheStorageKeys.token, value: loginEntity.token!);

  fetchDataUserLocal();
}

dynamic token = CacheHelper.getData(key: CacheStorageKeys.token);

LoginEntity? dataUserProfile;

Future<LoginEntity> fetchDataUserLocal() async {
  String? userDataProfile =
      await CacheHelper.getData(key: CacheStorageKeys.userInformation);
  if (jsonDecode(userDataProfile!) != null && userDataProfile.isNotEmpty) {
    dataUserProfile = LoginModel.fromJson(jsonDecode(userDataProfile));
  } else {
    dataUserProfile = LoginEntity();
  }
  token = CacheHelper.getData(key: CacheStorageKeys.token);

  return dataUserProfile!;
}

Future<void> clearDataUserLocal() async {
  LoginEntity loginEntity = LoginEntity();
  CacheHelper.saveData(
      key: CacheStorageKeys.userInformation, value: loginEntity.toJson());
  CacheHelper.saveData(key: CacheStorageKeys.token, value: 'null');
  fetchDataUserLocal();
}
class ChangePasswordArugu {
  final bool isProfile;
  final String email;

  ChangePasswordArugu({
    required this.isProfile,
    required this.email,
  });

  // fromJson factory constructor
  factory ChangePasswordArugu.fromJson(Map<String, dynamic> json) {
    return ChangePasswordArugu(
      isProfile: json['isProfile'],
      email: json['email'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'isProfile': isProfile,
      'email': email,
    };
  }
}
List <TopFiveModel>list=[
TopFiveModel(image: ImageAssets.yoro, title: 'Eur', buy: '51.70', sell: '52.18'),
TopFiveModel(image: ImageAssets.dolar, title: 'USD', buy: '48.10', sell: '48.40'),
TopFiveModel(image: ImageAssets.dinar, title: 'kWD', buy: '152.60', sell: '157.76'),
  TopFiveModel(image: ImageAssets.rayalKatry, title: 'Qar', buy: '13.06', sell: '13.11'),
TopFiveModel(image: ImageAssets.rayal, title: 'SAR', buy: '12.72', sell: '12.88'),

];List <TopFiveModel>list2=[
TopFiveModel(image: ImageAssets.bTC, title: 'BTC', buy: '5175.61', sell: '1.061'),
TopFiveModel(image: ImageAssets.eTH, title: 'ETH', buy: '2768.7', sell: '332.6 '),
TopFiveModel(image: ImageAssets.uSDT, title: 'USDT', buy: '1.0084', sell: '97.04 '),
  TopFiveModel(image: ImageAssets.sOL, title: 'SOL', buy: '116.61 ', sell: '51.008'),
TopFiveModel(image: ImageAssets.bNB, title: 'BNB', buy: '333.23', sell: '49.833'),
TopFiveModel(image: ImageAssets.xRP, title: 'XRP', buy: '0.5386', sell: '29.357'),
TopFiveModel(image: ImageAssets.uSDC, title: 'USDC', buy: '0.9996', sell: '112,938'),

];
