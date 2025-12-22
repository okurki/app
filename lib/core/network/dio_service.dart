import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:okurki_app/core/constants/constants.dart';

@module
abstract class DioService {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: baseURL,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Im5hbWUiLCJyb2xlIjoidXNlciIsImlhdCI6MTc2NDc2MTg2OCwiZXhwIjoxNzY0NzY1NDY4LCJ0eXBlIjoiQmVhcmVyIn0.rDDmxVixIOaZRyYLrsR7UZIFfs7yFE7N4i0KCb9-NkU',
      },
    ),
  );
}
