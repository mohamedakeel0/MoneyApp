

import 'package:flutter/material.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class ForgetPasswordCubic extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubic() : super(ForgetPasswordInitailState());

  static ForgetPasswordCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();


}
