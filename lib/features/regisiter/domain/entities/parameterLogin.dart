import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class RegisterParameters extends Equatable {
  final  String password;
  final String userName;
  final String email;
  final String mobile1;
  final int id;
  final PickedFile image;
  final String comfirmPassword;


  const  RegisterParameters({ required this.userName,
    required this.password,
    required this.image,
    required this.email,
    required this.mobile1,
    required this.id,

    required this.comfirmPassword,
  });


  @override
  List<Object?> get props => [password,userName,email,mobile1,id,image,comfirmPassword];

}