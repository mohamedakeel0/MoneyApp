import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/camera/data/model/Prediction.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';

abstract class BaseAddImageRepository {


  Future <Either<Failure, String>> convertImageToUrl(File image);
  Future <Either<Failure, Prediction>> resultPrediction(String image);






}