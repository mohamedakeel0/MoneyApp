import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';
import 'package:moneyapp/features/forget_password/data/models/forget_password_model.dart';

abstract class BaseForgetPasswordRemoteDataSource {
  Future<ForgetPasswordModel> forgetPassword(String email);
  Future<String> code(String code);
}

class ForgetPasswordRemoteDataSource extends BaseForgetPasswordRemoteDataSource {
  @override
  Future<ForgetPasswordModel> forgetPassword(String email) async {
    final response = await DioHelper.postdata(
      url: forgetPasswordVerifi,
      data: {
        'email':email,
      },
    );
    print('statusCode${response.realUri}');

    print('sdasda${response.data}');
    if (response.statusCode == 200) {

        print('sdasda');
        return ForgetPasswordModel.fromJson(response.data);

    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [], statusCode:response.statusCode==200?true:false, message:response.data));
    }
  }

  @override
  Future<String> code(String code) async {
    final response = await DioHelper.getdata(
      url: codeVerifi,
      query: {
        'code':code,
      },
    );
    print('statusCode${response.realUri}');

    print('sdasda${response.data}');
    if (response.statusCode == 200) {

      print('sdasda');
      return response.data;

    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [], statusCode:response.statusCode==200?true:false, message:response.data));
    }
  }
}
