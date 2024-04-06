

import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_state.dart';
class RegisiterCubic extends Cubit<RegisiterState> {
  RegisiterCubic() : super(RegisiterInitailState());

  static RegisiterCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fristNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  bool isSelect = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool? validationEmail;
  bool? validationPassword;
  bool? validationFristName;
  bool? validationSecondName;
  bool? validationPhone;
  bool? validationFirstPassword;
  bool? validationComfirmPassword;
  bool? validationAll;
  void changeSelectBox() {
    if (!isClosed) {
      emit(LodaingChangeSelectBoxState());
    }

    isSelect = !isSelect;

    if (!isClosed) {
      emit(SuccesChangeSelectBoxState());
    }
  }

  var isNewPassword = true;
  var isComfiremPassword = true;
  void changePasswordVisibility(String text) {
    if (!isClosed) {
      emit(InitailChangePasswordVisibilityState());
    }
  if (text==AppStrings.newPassword){
      isNewPassword = !isNewPassword;
    }else{
      isComfiremPassword = !isComfiremPassword;
    }



    if (!isClosed) {
      emit(SuccesChangePasswordVisibilityState());
    }
  }

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

    }else if(text==AppStrings.validationFristName){
      validationFristName=value;
      validationAll=value;

    }else if(text==AppStrings.validationSecondName){
      validationSecondName=value;
      validationAll=value;

    }else if(text==AppStrings.enterYourPhone){
      validationPhone=value;
      validationAll=value;

    }else if(text==AppStrings.enterYourComfirmPassword){
      validationComfirmPassword=value;
      validationAll=value;

    }
    if (!isClosed) {
      emit(SuccessValidationState());
    }
  }
  int?counts=0;
  void changePriorities(value){
    if (!isClosed) {
      emit(LoadingChangePrioritiesState());
    }
    counts=value;
    if (!isClosed) {
      emit(SuccessChangePrioritiesState());
    }
  }
}
