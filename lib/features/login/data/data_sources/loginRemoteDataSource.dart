
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';
import 'package:moneyapp/features/login/data/models/loginModel.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';

abstract class BaseUserLoginRemoteDataSource {
  Future<LoginModel> userLogin(LoginParameters loginParameters);
}

class UserLoginRemoteDataSource extends BaseUserLoginRemoteDataSource {
  @override
  Future<LoginModel> userLogin(LoginParameters loginParameters) async {
    final response = await DioHelper.postdata(
      url: login,
      data: {
        'eamil': loginParameters.email,
        'password': loginParameters.password,

      },
    );
print('statusCode${response.realUri}');

    if (response.statusCode == 200) {
      if(response.data['status']){
        return LoginModel.fromJson(response.data);
      }else{


        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }



    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
