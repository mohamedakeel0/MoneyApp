

import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/services/app_navigator.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/regisiter/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/regisiter/domain/usecases/register_use_case.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_state.dart';
import 'package:moneyapp/features/regisiter/presentation/screen/done_regisiter_screen.dart';
import 'package:moneyapp/shared/custom_dialog_error_.dart';
class RegisiterCubic extends Cubit<RegisiterState> {
  RegisiterCubic( this.registerUseCase) : super(RegisiterInitailState());
final RegisterUseCase registerUseCase;
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
  LoginEntity? regisiterEntity;
  RequestState? regisiterState = RequestState.loaded;
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


  Future<void> register(BuildContext context,
      RegisterParameters registerParameters) async {
    if (!isClosed) {
      regisiterState = RequestState.loading;
      emit(LoadingRegisterState());
    }
    final resultLogin = await registerUseCase(registerParameters).catchError((error) {
      print('dsfa+++++++++++++++++++++');
      print(error);
      ServerException errorMessageModel = error;
      dialogErrorLogin(context,
          errorText: errorMessageModel.errorMessageModel.message!);
      print('dsfa+++++++++++++++++++++');
      if (!isClosed) {
        regisiterState = RequestState.error;
        emit(ErrorRegisterState());
      }
    });
    resultLogin.fold((l) {
      dialogErrorLogin(context, errorText: l.message);
      if (!isClosed) {
        regisiterState = RequestState.error;
        emit(ErrorRegisterState());
      }
    }, (date) async {
      regisiterEntity = date;
      regisiterEntity!.phone=registerParameters.phoneNumber;

      savaDataUser(regisiterEntity!);
     Go.push(
         const DoneRegisiterScreen());
      if (!isClosed) {
        regisiterState = RequestState.loaded;
        emit(SuccessRegisterState());
      }
    });
  }

}
