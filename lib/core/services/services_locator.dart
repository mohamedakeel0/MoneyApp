

import 'package:get_it/get_it.dart';
import 'package:moneyapp/features/Reporting/presentation/manager/reporting_cubic.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_cubic.dart';
import 'package:moneyapp/features/change_password/presentation/bloc/change_password_cubic.dart';
import 'package:moneyapp/features/exchange/presentation/bloc/exchange_cubic.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_cubic.dart';
import 'package:moneyapp/features/login/data/data_sources/loginRemoteDataSource.dart';
import 'package:moneyapp/features/login/data/repositories/loginRepoImp.dart';
import 'package:moneyapp/features/login/domain/repositories/loginRepo.dart';
import 'package:moneyapp/features/login/domain/use_cases/loginUseCase.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_cubic.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_cubic.dart';

final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
    sl.registerFactory(() =>LoginCubic(sl()));
    sl.registerFactory(() =>RegisiterCubic());
    sl.registerFactory(() =>ForgetPasswordCubic());
    sl.registerFactory(() =>ReportingCubic());
    sl.registerFactory(() =>ProfileCubic());
    sl.registerFactory(() =>ChangePasswordCubic());
    sl.registerFactory(() =>AddReportingCubic());
    sl.registerFactory(() =>ExchangeCubic());



    //Use Cases

    sl.registerLazySingleton(() =>UserLoginUseCase(sl()));



    //Repository
    sl.registerLazySingleton<BaseUserLoginRepository>(() => UserLoginRepository(sl()));




    //DATA SOURCE

    sl.registerLazySingleton<BaseUserLoginRemoteDataSource>(() => UserLoginRemoteDataSource());






  }
}