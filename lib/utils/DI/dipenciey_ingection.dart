import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/utils/networking/api_service.dart';
import 'package:movies/utils/networking/dio_factory.dart';

import '../networking/api_constant.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<GetIt>(getIt);
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(
        dio,
        baseUrl: ApiConstant.apiBaseUrl,
      )); }