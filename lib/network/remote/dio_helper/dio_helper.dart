import 'package:dio/dio.dart';
import 'package:the_last3/network/local/cofig.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Config.baseurl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }
}
