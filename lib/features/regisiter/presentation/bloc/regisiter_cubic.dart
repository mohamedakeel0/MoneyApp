

import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_state.dart';
class RegisiterCubic extends Cubit<RegisiterState> {
  RegisiterCubic() : super(RegisiterInitailState());

  static RegisiterCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fristNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  bool isSelect = false;

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
