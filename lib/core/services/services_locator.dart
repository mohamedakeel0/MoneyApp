

import 'package:get_it/get_it.dart';
import 'package:moneyapp/features/Reporting/data/data_sources/reports_RemoteDataSource.dart';
import 'package:moneyapp/features/Reporting/data/repositories/reports_RepoImp.dart';
import 'package:moneyapp/features/Reporting/domain/repositories/reports_Repo.dart';
import 'package:moneyapp/features/Reporting/domain/use_cases/reports_use_case.dart';
import 'package:moneyapp/features/Reporting/presentation/manager/reporting_cubic.dart';
import 'package:moneyapp/features/add_report/data/data_sources/add_report_RemoteDataSource.dart';
import 'package:moneyapp/features/add_report/data/repositories/add_report_RepoImp.dart';
import 'package:moneyapp/features/add_report/domain/repositories/add_report_Repo.dart';
import 'package:moneyapp/features/add_report/domain/use_cases/add_report_use_case.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_cubic.dart';
import 'package:moneyapp/features/camera/data/data_sources/AddImageRemoteDataSource.dart';
import 'package:moneyapp/features/camera/data/repositories/AddImageRepoImp.dart';
import 'package:moneyapp/features/camera/domain/repositories/Add_image_Repo.dart';
import 'package:moneyapp/features/camera/domain/use_cases/AddImageUseCase.dart';
import 'package:moneyapp/features/camera/presentation/bloc/add_image_cubic.dart';
import 'package:moneyapp/features/change_password/data/data_sources/change_password_RemoteDataSource.dart';
import 'package:moneyapp/features/change_password/data/repositories/change_password_RepoImp.dart';
import 'package:moneyapp/features/change_password/domain/repositories/change_password_Repo.dart';
import 'package:moneyapp/features/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:moneyapp/features/change_password/presentation/bloc/change_password_cubic.dart';
import 'package:moneyapp/features/exchange/presentation/bloc/exchange_cubic.dart';
import 'package:moneyapp/features/forget_password/data/data_sources/ForgetPasswordRemoteDataSource.dart';
import 'package:moneyapp/features/forget_password/data/repositories/ForgetPasswordRepoImp.dart';
import 'package:moneyapp/features/forget_password/domain/repositories/ForgetPasswordRepo.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/ForgetPasswordUseCase.dart';
import 'package:moneyapp/features/forget_password/domain/use_cases/code_use_case.dart';
import 'package:moneyapp/features/forget_password/presentation/bloc/forget_password_cubic.dart';
import 'package:moneyapp/features/login/data/data_sources/loginRemoteDataSource.dart';
import 'package:moneyapp/features/login/data/repositories/loginRepoImp.dart';
import 'package:moneyapp/features/login/domain/repositories/loginRepo.dart';
import 'package:moneyapp/features/login/domain/use_cases/loginUseCase.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_cubic.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_cubic.dart';
import 'package:moneyapp/features/regisiter/data/datasource/register_remote_data_source.dart';
import 'package:moneyapp/features/regisiter/data/repository/register_repository.dart';
import 'package:moneyapp/features/regisiter/domain/repository/base_register_repository.dart';
import 'package:moneyapp/features/regisiter/domain/usecases/register_use_case.dart';
import 'package:moneyapp/features/regisiter/presentation/bloc/regisiter_cubic.dart';

final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
    sl.registerFactory(() =>LoginCubic(sl()));
    sl.registerFactory(() =>RegisiterCubic(sl()));
    sl.registerFactory(() =>ForgetPasswordCubic(sl(),sl()));
    sl.registerFactory(() =>ReportingCubic(sl()));
    sl.registerFactory(() =>ProfileCubic());
    sl.registerFactory(() =>ChangePasswordCubic(sl()));
    sl.registerFactory(() =>AddReportingCubic(sl()));
    sl.registerFactory(() =>ExchangeCubic());
    sl.registerFactory(() =>AddImageCubic(sl()));



    //Use Cases

    sl.registerLazySingleton(() =>UserLoginUseCase(sl()));
    sl.registerLazySingleton(() =>ReportsUseCase(sl()));
    sl.registerLazySingleton(() =>AddImageUseCase(sl()));
    sl.registerLazySingleton(() =>RegisterUseCase(sl()));
    sl.registerLazySingleton(() =>ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton(() =>CodeUseCase(sl()));
    sl.registerLazySingleton(() =>ChangePasswordUseCase(sl()));
    sl.registerLazySingleton(() =>AddReportUseCase(sl()));



    //Repository
    sl.registerLazySingleton<BaseUserLoginRepository>(() => UserLoginRepository(sl()));
    sl.registerLazySingleton<BaseAddImageRepository>(() => AddImageRepository(sl()));
    sl.registerLazySingleton<BaseRegisterRepository>(() => RegisterRepository(sl()));
    sl.registerLazySingleton<BaseForgetPasswordRepository>(() =>ForgetPasswordRepository(sl()));
    sl.registerLazySingleton<BaseChangePasswordRepository>(() =>ChangePasswordRepository(sl()));
    sl.registerLazySingleton<BaseAddReportRepository>(() =>AddReportRepository(sl()));
    sl.registerLazySingleton<BaseReportsRepository>(() =>ReportsRepository(sl()));






    // DATA SOURCE
    sl.registerLazySingleton<BaseReportsRemoteDataSource>(() => ReportsRemoteDataSource());
    sl.registerLazySingleton<BaseUserLoginRemoteDataSource>(() => UserLoginRemoteDataSource());
    sl.registerLazySingleton<BaseAddImageRemoteDataSource>(() => AddImageRemoteDataSource());
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(() => RegisterRemoteDataSource());
    sl.registerLazySingleton<BaseAddReportRemoteDataSource>(() => AddReportRemoteDataSource());
    sl.registerLazySingleton<BaseChangePasswordRemoteDataSource>(() => ChangePasswordRemoteDataSource());
    sl.registerLazySingleton<BaseForgetPasswordRemoteDataSource>(() => ForgetPasswordRemoteDataSource());





  }
}