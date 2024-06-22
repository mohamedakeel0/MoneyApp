import 'package:flutter/material.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/forget_password/domain/entities/forget_password_entity.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/ForgetPasswordUseCase.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/code_use_case.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/shared/custom_dialog_error_.dart';

class ForgetPasswordCubic extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubic(this.forgetPasswordUseCase, this.codeUseCase)
      : super(ForgetPasswordInitailState());
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final CodeUseCase codeUseCase;

  static ForgetPasswordCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  ForgetPasswordEntity? forgetPasswordEntity;
  String? messageCode;

  var codeEnter;
  RequestState? forgetPasswordState = RequestState.loaded;
  RequestState? codeState = RequestState.loaded;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Future<void> forgetPassword(BuildContext context, String email) async {
    if (!isClosed) {
      forgetPasswordState = RequestState.loading;
      emit(LoadingForgetPasswordState());
    }
    final resultLogin = await forgetPasswordUseCase(email).catchError((error) {
      print('dsfa+++++++++++++++++++++');
      print(error);
      ServerException errorMessageModel = error;
      dialogErrorLogin(context,
          errorText: errorMessageModel.errorMessageModel.message!);
      print('dsfa+++++++++++++++++++++');
      if (!isClosed) {
        forgetPasswordState = RequestState.error;
        emit(ErrorForgetPasswordState());
      }
    });
    resultLogin.fold((l) {
      if (!isClosed) {
        forgetPasswordState = RequestState.error;
        emit(ErrorForgetPasswordState());
      }
    }, (date) async {
      forgetPasswordEntity = date;
      Navigator.pushNamed(context,
          Routes.varificationRoute,arguments: email.toString());
      if (!isClosed) {
        forgetPasswordState = RequestState.loaded;
        emit(SuccessForgetPasswordState());
      }
    });
  }
  Future<void> code(BuildContext context, String code,String email) async {
    if (!isClosed) {
      codeState = RequestState.loading;
      emit(LoadingCodeState());
    }
    final resultLogin = await codeUseCase(code).catchError((error) {
      print('dsfa+++++++++++++++++++++');
      print(error);
      ServerException errorMessageModel = error;
      dialogErrorLogin(context,
          errorText: errorMessageModel.errorMessageModel.message!);
      print('dsfa+++++++++++++++++++++');
      if (!isClosed) {
        codeState = RequestState.error;
        emit(ErrorCodeState());
      }
    });
    resultLogin.fold((l) {
      if (!isClosed) {
        codeState = RequestState.error;
        emit(ErrorCodeState());
      }
    }, (date) async {
      messageCode = date;
      Navigator.pushReplacementNamed(
          context, Routes.changePasswordRoute,
          arguments: ChangePasswordArugu(isProfile: false,email: email));
      if (!isClosed) {
        codeState = RequestState.loaded;
        emit(SuccessCodeState());
      }
    });
  }
  bool? validationEmail;
  void validation(text, value) {
    if (!isClosed) {
      emit(LoadingValidationState());
    }
    if (text == AppStrings.email) {
      validationEmail = value;
    }
    if (!isClosed) {
      emit(SuccessValidationState());
    }
  }
  void changeCode(String value){
    if (!isClosed) {
      emit(SuccessChangeCodeState());
    }
    codeEnter=value;
    if (!isClosed) {
      emit(SuccessChangeCodeState());
    }
  }
}
