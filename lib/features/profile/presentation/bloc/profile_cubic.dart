

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_state.dart';
class ProfileCubic extends Cubit<ProfileState> {
  ProfileCubic() : super(InitailProfileState());

  static ProfileCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
void informationUser(){
  if (!isClosed) {
    emit(LoadingInformationUserState());
  }
  emailController.text='mohamed@gqamil.com';
  userNameController.text='mohamedAkeel.com';
  phoneController.text='012584254522233';
  if (!isClosed) {
    emit(SuccesInformationUserState());
  }
}
}
