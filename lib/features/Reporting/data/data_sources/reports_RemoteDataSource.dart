import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';
import 'package:moneyapp/features/add_report/data/models/add_report_model.dart';
import 'package:moneyapp/features/add_report/domain/use_cases/add_report_use_case.dart';
import 'package:moneyapp/features/forget_password/data/models/forget_password_model.dart';

abstract class BaseReportsRemoteDataSource {

  Future<List<AddReportModel>> reports();
}

class ReportsRemoteDataSource extends BaseReportsRemoteDataSource {
  @override
  Future<List<AddReportModel>> reports() async {


    final response = await DioHelper.getdata(
      url: report,
    );
    print('statusCode${response.realUri}');

    print('sdasda${response.data}');
    if (response.statusCode == 200) {

        print('sdasda');
        return  List<AddReportModel>.from(response.data.map((x)=>AddReportModel.fromJson(x)));

    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [], statusCode:response.statusCode==200?true:false, message:response.data));
    }
  }


}
