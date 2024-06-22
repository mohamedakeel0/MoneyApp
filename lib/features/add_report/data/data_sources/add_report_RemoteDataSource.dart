import 'package:dio/dio.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';
import 'package:moneyapp/features/add_report/data/models/add_report_model.dart';
import 'package:moneyapp/features/add_report/domain/use_cases/add_report_use_case.dart';
import 'package:moneyapp/features/forget_password/data/models/forget_password_model.dart';

abstract class BaseAddReportRemoteDataSource {

  Future<AddReportModel> addReport(AddReportParameter addReportParameter);
}

class AddReportRemoteDataSource extends BaseAddReportRemoteDataSource {
  @override
  Future<AddReportModel> addReport(AddReportParameter addReportParameter) async {
    FormData formData = FormData();
    formData = FormData.fromMap({
      'name': addReportParameter.name,
      'location': addReportParameter.location,

    });
    if (addReportParameter.image != null) {
      formData.files.add(MapEntry(
        "image",
        await MultipartFile.fromFile(addReportParameter.image!.path,
            filename: Uri.file(addReportParameter.image!.path).pathSegments.last),
      ));
    }

    final response = await DioHelper.postdata(
      url: report,
      data: formData,
    );
    print('statusCode${response.realUri}');

    print('sdasda${response.data}');
    if (response.statusCode == 200) {

        print('sdasda');
        return AddReportModel.fromJson(response.data);

    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [], statusCode:response.statusCode==200?true:false, message:response.data));
    }
  }


}
