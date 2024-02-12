

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_state.dart';
class ProfileCubic extends Cubit<ProfileState> {
  ProfileCubic() : super(InitailProfileState());

  static ProfileCubic get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

}
