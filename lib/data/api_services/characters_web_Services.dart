import 'package:dio/dio.dart';
import 'package:flutter_breaking_film/constants/strings.dart';
import 'package:flutter_breaking_film/data/models/api_services_model.dart';

class CharactersWebServices extends ApiServicesModel {
  late Dio _dio;
  CharactersWebServices() {
    _prepareApiCall();
  }
  void _prepareApiCall() {
    BaseOptions options = BaseOptions(
      baseUrl: characterBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    _dio = Dio(options);
  }

  @override
  Future<List> getAllCharacters() async {
    try {
      Response response = await _dio.get('characters');
      print(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      print("the server error => ${e.error.toString()}");
      return [];
    } catch (e) {
      print("the catch error => ${e.toString()}");
      return [];
    }
  }
}
