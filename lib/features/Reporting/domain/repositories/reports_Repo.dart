import 'package:dartz/dartz.dart';
import 'package:moneyapp/core/error/faliure.dart';
import 'package:moneyapp/features/add_report/domain/entities/add_report_entity.dart';
import 'package:moneyapp/features/add_report/domain/use_cases/add_report_use_case.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';

abstract class BaseReportsRepository {


  Future <Either<Failure, List<AddReportEntity>>> reports();







}