

import 'package:equatable/equatable.dart';

class ReportingState extends Equatable {

  @override
  List<Object?> get props => [];
}
class InitailReportingState extends ReportingState{}

class SuccesReportsState extends ReportingState{}
class LoadingReportsState extends ReportingState{}
class SuccesUpdateFilteredReportsState extends ReportingState{}
class LoadingUpdateFilteredReportsState extends ReportingState{}
class ErrorReportsState extends ReportingState{}
