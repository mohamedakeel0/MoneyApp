

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_state.dart';
class ProfileCubic extends Cubit<ProfileState> {
  ProfileCubic() : super(InitailProfileState());

  static ProfileCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  LoginEntity? loginEntity;


void informationUser(){
  if (!isClosed) {
    emit(LoadingInformationUserState());
  }
  fetchDataUserLocal().then((value) {
    loginEntity=value;
    setDataUser();
  });
  if (!isClosed) {
    emit(SuccesInformationUserState());
  }
}
void setDataUser(){
  emailController.text=loginEntity!.email!;
  userNameController.text=loginEntity!.username!;
  phoneController.text=loginEntity!.phone!;
}
}
