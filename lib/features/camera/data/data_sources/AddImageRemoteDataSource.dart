import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/End_point.dart';
import 'package:moneyapp/core/network/dio_helper.dart';
import 'package:moneyapp/core/network/error_message_model.dart';
import 'package:moneyapp/features/camera/data/model/Prediction.dart';
import 'package:moneyapp/features/login/data/models/loginModel.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';

abstract class BaseAddImageRemoteDataSource {
  Future<String> convertImageToUrl(File image);

  Future<Prediction> resultPrediction(String image);
}

class AddImageRemoteDataSource extends BaseAddImageRemoteDataSource {


  @override
  Future<String> convertImageToUrl(File image) async {
    late Dio  dio = Dio(
      BaseOptions(
        baseUrl: convertImage,
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    FormData formData = FormData();
    formData = FormData.fromMap({
      'isChangeLink': true,
    });
    formData.files.add(MapEntry(
      "formFile",
      await MultipartFile.fromFile(image.path,
          filename: Uri.file(image.path).pathSegments.last),
    ));

    final response = await dio
        .post(
      'ConvermImage',
      data: formData,
    )
        .catchError((e) {
      print('sdasda${e.toString()}');
    });
    print('statusCode${response.realUri}');
    print('sdasda${response.data}');
    if (response.statusCode == 200) {
      print('sdasda');
      return response.data;
    } else {
      print('sdasda${response.data}');
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [],
              statusCode: response.statusCode == 200 ? true : false,
              message: response.data));
    }
  }

  @override
  Future<Prediction> resultPrediction(String image) async {
    late Dio  dio = Dio(
      BaseOptions(
        baseUrl: detectFakeMoney,
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    final response = await dio.get(
      'Detect_fake_money',
      queryParameters: {
        'image_url': image,
      },
    ).catchError((e) {
      print('sdasda${e.toString()}');
    });

    if (response.statusCode == 200) {

      return Prediction.fromJson(response.data);
    } else {
      print('sdasda${response.data}');
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              errors: [],
              statusCode: response.statusCode == 200 ? true : false,
              message: response.data));
    }
  }
}
