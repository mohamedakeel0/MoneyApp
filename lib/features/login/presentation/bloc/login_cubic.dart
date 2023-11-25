

import 'package:flutter/material.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCubic extends Cubit<LoginState> {
  LoginCubic() : super(LoginInitailState());

  static LoginCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

}
