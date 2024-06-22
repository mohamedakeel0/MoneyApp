
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/ForgetPasswordUseCase.dart';

import '../../../../core/usecase/base_usecase.dart';
class CodeUseCase extends BaseUseCase<String,String>{
  final BaseForgetPasswordRepository baseForgetPasswordRepository;
  CodeUseCase(this.baseForgetPasswordRepository);
  @override
  Future<Either<Failure, String>> call(String email ) async{
    return await baseForgetPasswordRepository.code(email);
  }



}