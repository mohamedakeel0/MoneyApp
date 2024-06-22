import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';
import 'package:moneyapp/features/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:moneyapp/features/forget_password/data/data_sources/ForgetPasswordRemoteDataSource.dart';
import 'package:moneyapp/features/forget_password/data/models/forget_password_model.dart';

abstract class BaseChangePasswordRemoteDataSource {
  Future<String> changePassword(ChangePasswordParameter changePasswordParameter);

}

class ChangePasswordRemoteDataSource extends BaseChangePasswordRemoteDataSource {
  @override
  Future<String> changePassword(ChangePasswordParameter changePasswordParameter) async {
    final response = await DioHelper.postdata(
      url: resetPasswordVerifi,
      data: changePasswordParameter.toJson(),
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
