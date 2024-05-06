

import 'package:equatable/equatable.dart';

class LoginState extends Equatable {

  @override
  List<Object?> get props => [];
}
class LoginInitailState extends LoginState{}

//-------------ChangeSelectBox---------------
class LodaingChangeSelectBoxState extends LoginState{}
class SuccesChangeSelectBoxState extends LoginState{}
//-------------Validation---------------
class LoadingValidationState extends LoginState{}
class SuccessValidationState extends LoginState{}
//-------------userLogin---------------
class LoadingUserLoginState extends LoginState{}
class ErrorUserLoginState extends LoginState{}
class SuccessUserLoginState extends LoginState{}
