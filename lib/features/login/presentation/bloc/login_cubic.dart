

import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCubic extends Cubit<LoginState> {
  LoginCubic() : super(LoginInitailState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static LoginCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSelect = false;
  bool? validationEmail;
  bool? validationPassword;
  bool? validationAll;

  void validation(text,value){
    if (!isClosed) {
      emit(LoadingValidationState());
    }
    if(text== AppStrings.enterYourPassword){
      validationPassword=value;
      validationAll=value;
    }else if(text==AppStrings.enterYourEmail){
      validationEmail=value;
      validationAll=value;

    }
    if (!isClosed) {
      emit(SuccessValidationState());
    }
  }
  void changeSelectBox() {
    if (!isClosed) {
      emit(LodaingChangeSelectBoxState());
    }

    isSelect = !isSelect;

    if (!isClosed) {
      emit(SuccesChangeSelectBoxState());
    }
  }
}
