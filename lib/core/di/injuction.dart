import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/presentation/controller/cubit/app_cubit_cubit.dart';
import 'package:store_app/core/serivces/graphql/api_service.dart';
import 'package:store_app/core/serivces/graphql/dio_factory.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  await _initCore();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();

  sl.registerFactory(AppCubit.new);
  sl.registerLazySingleton(() => ApiService(dio));
}
