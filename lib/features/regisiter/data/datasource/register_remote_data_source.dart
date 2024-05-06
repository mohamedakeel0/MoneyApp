import 'package:dio/dio.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';

import 'package:moneyapp/features/login/data/models/loginModel.dart';
import 'package:moneyapp/features/regisiter/domain/entities/parameterLogin.dart';

abstract class BaseRegisterRemoteDataSource {


  Future<LoginModel>register(RegisterParameters registerParameters);


}
class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<LoginModel> register(RegisterParameters registerParameters)async {
    FormData formData = FormData();

    formData = FormData.fromMap({
      'user_name':registerParameters.userName,
      'password':registerParameters.password,
      'email':registerParameters.email,
      'comfirm_password':registerParameters.comfirmPassword,
      'player_id':registerParameters.id,
      'mobile1':registerParameters.mobile1,
    });
    formData.files.add(MapEntry("image", await MultipartFile.fromFile(registerParameters.image.path, filename: Uri.file(registerParameters.image.path).pathSegments.last), ));

    final response = await DioHelper.postdata(url: regisiter,data: formData);

    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [], statusCode:response.statusCode==200?true:false, message:response.data));
  }


}}