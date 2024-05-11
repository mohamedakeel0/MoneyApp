

import 'package:get_it/get_it.dart';
import 'package:moneyapp/features/Reporting/presentation/manager/reporting_cubic.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_cubic.dart';
import 'package:moneyapp/features/camera/data/data_sources/AddImageRemoteDataSource.dart';
import 'package:moneyapp/features/camera/data/repositories/AddImageRepoImp.dart';
import 'package:moneyapp/features/camera/domain/repositories/Add_image_Repo.dart';
import 'package:moneyapp/features/camera/domain/use_cases/AddImageUseCase.dart';
import 'package:moneyapp/features/camera/presentation/bloc/add_image_cubic.dart';
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
    sl.registerFactory(() =>AddImageCubic(sl()));



    //Use Cases

    sl.registerLazySingleton(() =>UserLoginUseCase(sl()));
    sl.registerLazySingleton(() =>AddImageUseCase(sl()));



    //Repository
    sl.registerLazySingleton<BaseUserLoginRepository>(() => UserLoginRepository(sl()));
    sl.registerLazySingleton<BaseAddImageRepository>(() => AddImageRepository(sl()));





    //DATA SOURCE

    sl.registerLazySingleton<BaseUserLoginRemoteDataSource>(() => UserLoginRemoteDataSource());
    sl.registerLazySingleton<BaseAddImageRemoteDataSource>(() => AddImageRemoteDataSource());






  }
}