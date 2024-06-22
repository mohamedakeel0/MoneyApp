import 'package:flutter/material.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/Reporting/domain/use_cases/reports_use_case.dart';
import 'package:moneyapp/features/Reporting/presentation/manager/reporting_state.dart';
import 'package:moneyapp/features/add_report/domain/entities/add_report_entity.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/ForgetPasswordUseCase.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/shared/custom_dialog_error_.dart';

class ReportingCubic extends Cubit<ReportingState> {
  ReportingCubic(this.reportsUseCase) : super(InitailReportingState());
  final ReportsUseCase reportsUseCase;

  static ReportingCubic get(context) => BlocProvider.of(context);
  TextEditingController reportingController = TextEditingController();
  RequestState? addReportState = RequestState.loaded;
  List<AddReportEntity>? reports;

  Future<void> report() async {
    if (!isClosed) {
      addReportState = RequestState.loading;
      emit(LoadingReportsState());
    }
    final resultLogin =
        await reportsUseCase(const NoParameters()).catchError((error) {
      print('dsfa+++++++++++++++++++++');
      print(error);
      ServerException errorMessageModel = error;

      print('dsfa+++++++++++++++++++++');
      if (!isClosed) {
        addReportState = RequestState.error;
        emit(ErrorReportsState());
      }
    });
    resultLogin.fold((l) {
      if (!isClosed) {
        addReportState = RequestState.error;
        emit(ErrorReportsState());
      }
    }, (date) async {
      reports = date;

      if (!isClosed) {
        addReportState = RequestState.loaded;
        emit(SuccesReportsState());
      }
    });
  }
  void updateFilteredReports(String searchQuery){
    if (!isClosed) {
      addReportState = RequestState.loading;
      emit(LoadingUpdateFilteredReportsState());
    }
    reports = reports!.where((item) {
      return item.location!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    if (!isClosed) {
      addReportState = RequestState.loaded;
      emit(SuccesUpdateFilteredReportsState());
    }
  }
}
