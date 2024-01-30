

import 'package:flutter/material.dart';
import 'package:moneyapp/features/Reporting/presentation/manager/reporting_state.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class ReportingCubic extends Cubit<ReportingState> {
  ReportingCubic() : super(InitailReportingState());

  static ReportingCubic get(context) => BlocProvider.of(context);
  TextEditingController reportingController = TextEditingController();

}
