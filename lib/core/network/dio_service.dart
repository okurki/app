import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioService {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: 'http://10.90.137.195:8000'));
}
