import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/camera/data/model/Prediction.dart';
import 'package:moneyapp/features/camera/domain/repositories/Add_image_Repo.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/login/domain/repositories/loginRepo.dart';


import '../../../../core/usecase/base_usecase.dart';

class AddImageUseCase extends BaseUseCase<String,File>{
  final BaseAddImageRepository baseUserLoginRepository;
  AddImageUseCase(this.baseUserLoginRepository);
  @override
  Future<Either<Failure, String>> call(File image) async{
    return await baseUserLoginRepository.convertImageToUrl(image);
  }

  @override
  Future<Either<Failure, Prediction>> resultPrediction(String image) async{
    return await baseUserLoginRepository.resultPrediction(image);
  }

}
