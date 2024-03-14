

import 'package:equatable/equatable.dart';

class ExchangeState extends Equatable {

  @override
  List<Object?> get props => [];
}
class InitailReportingState extends ExchangeState{}
class LoadingUploadImageState extends ExchangeState{}
class SuccesUploadImageState extends ExchangeState{}
class ErrorUploadImageState extends ExchangeState{}
class UpdateLocationState extends ExchangeState{}
class LoadingCaptureImageClientState extends ExchangeState{}
class SuccessCaptureImageClientState extends ExchangeState{}
class InitialLocationState extends ExchangeState{}
class SuccesGetPermissionState extends ExchangeState{}
class CameraUpdateState extends ExchangeState{}
class InitailCheckPermissionState extends ExchangeState{}
class ErrorCheckPermissionState extends ExchangeState{}
class SuccesCheckPermissionState extends ExchangeState{}

