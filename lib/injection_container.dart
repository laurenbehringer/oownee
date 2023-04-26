import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oownee/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:oownee/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:oownee/presentation/bloc/login/login_bloc.dart';
import 'package:oownee/presentation/bloc/owner_view/owner_view_bloc.dart';
import 'package:oownee/presentation/bloc/view_property/property_view_bloc.dart';
import 'package:oownee/presentation/bloc/view_tenant/view_tenant_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => ForgotPasswordBloc());
  sl.registerFactory(() => DashboardBloc());
  sl.registerFactory(() => LoginBloc());
  sl.registerFactory(() => OwnerViewBloc());
  sl.registerFactory(() => PropertyViewBloc());
  sl.registerFactory(() => ViewTenantBloc());

  //helper
  sl.registerLazySingleton(() => Dio());
}
