

import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable {

  @override
  List<Object?> get props => [];
}
class ForgetPasswordInitailState extends ForgetPasswordState{}
class LodaingChangeSelectBoxState extends ForgetPasswordState{}
class SuccesChangeSelectBoxState extends ForgetPasswordState{}

//------------- ForgetPassword---------------
class LoadingForgetPasswordState extends ForgetPasswordState{}
class ErrorForgetPasswordState extends ForgetPasswordState{}
class SuccessForgetPasswordState extends ForgetPasswordState{}
//------------- Code---------------
class LoadingCodeState extends ForgetPasswordState{}
class ErrorCodeState extends ForgetPasswordState{}
class SuccessCodeState extends ForgetPasswordState{}
//-------------Validation---------------
class LoadingValidationState extends ForgetPasswordState{}
class SuccessValidationState extends ForgetPasswordState{}
//-------------ChangeCode---------------
class LoadingChangeCodeState extends ForgetPasswordState{}
class SuccessChangeCodeState extends ForgetPasswordState{}
