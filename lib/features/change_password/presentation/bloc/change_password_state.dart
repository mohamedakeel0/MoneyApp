

import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {

  @override
  List<Object?> get props => [];
}
class InitailChangePasswordState extends ChangePasswordState{}
class InitailChangePasswordVisibilityState extends ChangePasswordState{}
class SuccesChangePasswordVisibilityState extends ChangePasswordState{}

//------------- ChangePassword---------------
class LoadingChangePasswordState extends ChangePasswordState{}
class ErrorChangePasswordState extends ChangePasswordState{}
class SuccessChangePasswordState extends ChangePasswordState{}
