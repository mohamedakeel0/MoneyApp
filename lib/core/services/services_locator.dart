

import 'package:get_it/get_it.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_cubic.dart';

final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
    sl.registerFactory(() =>LoginCubic());
    sl.registerFactory(() =>RegisiterCubic());



    //Use Cases





    //Repository




    //DATA SOURCE







  }
}