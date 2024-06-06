import 'package:dio/dio.dart';
import 'package:eco_market/common/helpers/catch_exception.dart';

class ApiRequester {
  final String baseUrl = 'https://www.challenge-neobook.org/ecobak';

  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl:baseUrl,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<Response> toGet(String url) async {
    Dio dio = await initDio();

    try {
      return dio.get(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url) async {
    Dio dio = await initDio();

    try {
      return dio.post(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPut(String url) async {
    Dio dio = await initDio();

    try {
      return dio.put(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toDelete(String url) async {
    Dio dio = await initDio();

    try {
      return dio.delete(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}