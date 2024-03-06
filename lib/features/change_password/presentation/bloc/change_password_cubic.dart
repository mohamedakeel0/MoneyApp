

import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/change_password/presentation/bloc/change_password_state.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class ChangePasswordCubic extends Cubit<ChangePasswordState> {
  ChangePasswordCubic() : super(InitailChangePasswordState());

  static ChangePasswordCubic get(context) => BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  var suffix = Icons.visibility_outlined;

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

}
