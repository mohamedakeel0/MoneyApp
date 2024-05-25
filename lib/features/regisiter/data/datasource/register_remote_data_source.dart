import 'package:dio/dio.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';

import 'package:moneyapp/features/login/data/models/loginModel.dart';
import 'package:moneyapp/features/regisiter/domain/entities/parameterLogin.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<LoginModel> register(RegisterParameters registerParameters);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<LoginModel> register(RegisterParameters registerParameters) async {
    final response = await DioHelper.postdata(
        url: regisiter, data: registerParameters.toJson());

    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [],
              statusCode: response.statusCode == 200 ? true : false,
              message: response.data));
    }
  }
}
