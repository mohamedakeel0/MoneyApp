

import 'package:flutter/material.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:moneyapp/features/change_password/presentation/bloc/change_password_state.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/shared/custom_dialog_error_.dart';
class ChangePasswordCubic extends Cubit<ChangePasswordState> {
  ChangePasswordCubic(this.changePasswordUseCase) : super(InitailChangePasswordState());
final ChangePasswordUseCase changePasswordUseCase;
  static ChangePasswordCubic get(context) => BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  var suffix = Icons.visibility_outlined;
  String? messageCode;
  RequestState? codeState = RequestState.loaded;
  var isCurrentPassword = true;
  var isNewPassword = true;
  var isComfiremPassword = true;
  void changePasswordVisibility(String text) {
    if (!isClosed) {
      emit(InitailChangePasswordVisibilityState());
    }
    if(text==AppStrings.currentPassword){
      isCurrentPassword = !isCurrentPassword;
    }else if (text==AppStrings.newPassword){
      isNewPassword = !isNewPassword;
    }else{
      isComfiremPassword = !isComfiremPassword;
    }



    if (!isClosed) {
      emit(SuccesChangePasswordVisibilityState());
    }
  }
  Future<void> changePassword(BuildContext context, ChangePasswordParameter changePasswordParameter) async {
    if (!isClosed) {
      codeState = RequestState.loading;
      emit(LoadingChangePasswordState());
    }
    final resultLogin = await changePasswordUseCase(changePasswordParameter).catchError((error) {
      print('dsfa+++++++++++++++++++++');
      print(error);
      ServerException errorMessageModel = error;
      dialogErrorLogin(context,
          errorText: errorMessageModel.errorMessageModel.message!);
      print('dsfa+++++++++++++++++++++');
      if (!isClosed) {
        codeState = RequestState.error;
        emit(ErrorChangePasswordState());
      }
    });
    resultLogin.fold((l) {
      if (!isClosed) {
        codeState = RequestState.error;
        emit(ErrorChangePasswordState());
      }
    }, (date) async {
      messageCode = date;
      comfirmPasswordController
          .text='';  newPasswordController
          .text='';passwordController
          .text='';
      Navigator.pushReplacementNamed(
          context, Routes.successfullyRoute);
      if (!isClosed) {
        codeState = RequestState.loaded;
        emit(SuccessChangePasswordState());
      }
    });
  }

}
