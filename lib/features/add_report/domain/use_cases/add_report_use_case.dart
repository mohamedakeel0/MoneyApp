
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/add_report/domain/entities/add_report_entity.dart';
import 'package:moneyapp/features/add_report/domain/repositories/add_report_Repo.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/ForgetPasswordUseCase.dart';

import '../../../../core/usecase/base_usecase.dart';
class  AddReportUseCase extends BaseUseCase<AddReportEntity,AddReportParameter>{
  final BaseAddReportRepository baseAddReportRepository;
  AddReportUseCase(this.baseAddReportRepository);
  @override
  Future<Either<Failure, AddReportEntity>> call(AddReportParameter addReportParameter ) async{
    return await baseAddReportRepository.addReport(addReportParameter);
  }



}

class AddReportParameter{
  final String name;
  final String location;
  final File image;

  AddReportParameter({
    required this.name,
    required this.location,
    required this.image,
  });
}