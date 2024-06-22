import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';

import '../../../../core/usecase/base_usecase.dart';

class ForgetPasswordUseCase extends BaseUseCase<ForgetPasswordEntity,String>{
  final BaseForgetPasswordRepository baseForgetPasswordRepository;
  ForgetPasswordUseCase(this.baseForgetPasswordRepository);
  @override
  Future<Either<Failure, ForgetPasswordEntity>> call(String email) async{
    return await baseForgetPasswordRepository.forgetPassword(email);
  }



}
class   NoParameters extends Equatable{
  const NoParameters();

  @override
  List<Object?> get props => [];

}