import 'package:flutter/material.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/network/error_message_model.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/domain/entities/parameterLogin.dart';
import 'package:moneyapp/features/login/domain/use_cases/loginUseCase.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/shared/custom_dialog_error_.dart';

class LoginCubic extends Cubit<LoginState> {
  LoginCubic(this.getUserLoginUseCase) : super(LoginInitailState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final UserLoginUseCase getUserLoginUseCase;

  static LoginCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSelect = false;
  bool? validationEmail;
  bool? validationPassword;
  bool? validationAll;
  LoginEntity? loginEntity;
  RequestState? loginState = RequestState.loaded;

  void validation(text, value) {
    if (!isClosed) {
      emit(LoadingValidationState());
    }
    if (text == AppStrings.enterYourPassword) {
      validationPassword = value;
      validationAll = value;
    } else if (text == AppStrings.enterYourEmail) {
      validationEmail = value;
      validationAll = value;
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

  Future<void> userLogin(
      BuildContext context, LoginParameters loginParameters) async {
    if (!isClosed) {
      loginState = RequestState.loading;
      emit(LoadingUserLoginState());
    }
    final resultLogin = await getUserLoginUseCase(LoginParameters(
      email: loginParameters.email,
      password: loginParameters.password,
    )).catchError((error) {
      ServerException errorMessageModel = error;
      dialogErrorLogin(context, errorText: errorMessageModel.errorMessageModel.message!);
      if (!isClosed) {
        loginState = RequestState.error;
        emit(ErrorUserLoginState());
      }
    });
    resultLogin.fold((l) {
      dialogErrorLogin(context, errorText: l.message);
      if (!isClosed) {
        loginState = RequestState.error;
        emit(ErrorUserLoginState());
      }
    }, (date) async {loginEntity = date;emailController.text='';passwordController.text='';
      savaDataUser(loginEntity!);
      dialogErrorLogin(context, errorText: AppStrings.logInSuccessfully);
      if (!isClosed) {
        loginState = RequestState.loaded;
        emit(SuccessUserLoginState());
      }
    });
  }


}
