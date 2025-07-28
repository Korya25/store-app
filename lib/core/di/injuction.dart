import 'package:get_it/get_it.dart';
import 'package:store_app/core/presentation/controller/cubit/app_cubit_cubit.dart';
import 'package:store_app/core/serivces/graphql/api_service.dart';
import 'package:store_app/core/serivces/graphql/dio_factory.dart';
import 'package:store_app/features/auth/data/datasources/auth_data_source.dart';
import 'package:store_app/features/auth/data/repositories/auth_repo.dart';
import 'package:store_app/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();

  sl.registerFactory(AppCubit.new);
  sl.registerLazySingleton(() => ApiService(dio));
}

Future<void> _initAuth() async {
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSource(sl()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl()));
  sl.registerFactory(() => AuthBloc(sl()));
}
