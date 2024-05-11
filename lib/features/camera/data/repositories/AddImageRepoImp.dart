import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/camera/data/data_sources/AddImageRemoteDataSource.dart';
import 'package:moneyapp/features/camera/data/model/Prediction.dart';
import 'package:moneyapp/features/camera/domain/repositories/Add_image_Repo.dart';
import 'package:moneyapp/features/login/data/data_sources/loginRemoteDataSource.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/login/domain/repositories/loginRepo.dart';

class AddImageRepository extends BaseAddImageRepository{
  final BaseAddImageRemoteDataSource baseAddImageRemoteDataSource;

  AddImageRepository(this.baseAddImageRemoteDataSource);



  @override
  Future<Either<Failure, String>> convertImageToUrl(File image) async{
    final result= await baseAddImageRemoteDataSource.convertImageToUrl(image);
    try{
      return Right(result);
    }on ServerException catch(failure){
      print("0000000000${failure.errorMessageModel.errors![0]}");
      print(failure.errorMessageModel.message);
      return Left(ServerFailure(failure.errorMessageModel.errors![0]??
      failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, Prediction>> resultPrediction(String image) async{
    final result= await baseAddImageRemoteDataSource.resultPrediction(image);
    try{
      return Right(result);
    }on ServerException catch(failure){
      print("0000000000${failure.errorMessageModel.errors![0]}");
      print(failure.errorMessageModel.message);
      return Left(ServerFailure(failure.errorMessageModel.errors![0]??
          failure.errorMessageModel.message));
    }
  }







}