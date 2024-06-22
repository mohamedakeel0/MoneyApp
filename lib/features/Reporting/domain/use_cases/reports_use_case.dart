
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/Reporting/domain/repositories/reports_Repo.dart';
import 'package:moneyapp/features/add_report/domain/entities/add_report_entity.dart';
import 'package:moneyapp/features/add_report/domain/repositories/add_report_Repo.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/ForgetPasswordUseCase.dart';

import '../../../../core/usecase/base_usecase.dart';
class ReportsUseCase extends BaseUseCase< List<AddReportEntity>,NoParameters>{
  final BaseReportsRepository baseReportsRepository;
  ReportsUseCase(this.baseReportsRepository);
  @override
  Future<Either<Failure,  List<AddReportEntity>>> call(NoParameters parameters ) async{
    return await baseReportsRepository.reports();
  }



}

