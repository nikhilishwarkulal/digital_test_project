import 'package:digitaltestproject/common/app_constants.dart';
import 'package:dio/dio.dart';

String _kBaseUrl = "";

///[CustomDio] A abstraction class
abstract class CustomDio {
  Future<String> callApi({String? customUrl, Map<String, String>? queryParams});
}

///[CustomDioImpl] A implementation of abstraction class
class CustomDioImpl implements CustomDio {
  ///[CustomDioImpl] constructer wich takes optional value [Dio] and
  ///[String] base url if none is defined a default base url will be taken.
  CustomDioImpl({Dio? dioInject, String? baseUrl}) {
    if (dioInject == null) {
      dio = Dio();
    } else {
      dio = dioInject;
    }
    if (baseUrl == null) {
      apiUrl = _kBaseUrl;
    } else {
      apiUrl = baseUrl;
    }
  }
  late String apiUrl;
  late Dio dio;

  ///[callApi] will make a network call through internet and
  ///[String] returns a response in string format
  ///[customUrl] can be passed at the time of api call.
  ///[queryParams] can be passed optionally
  ///if not passed  url will be taken from constructor.
  @override
  Future<String> callApi(
      {String? customUrl, Map<String, String>? queryParams}) async {
    try {
      if (queryParams != null) {
        ///[client_id] is mandatory for all API calls.
        ///This logic should be changed based on dynamic client id
        ///on Auth
        queryParams["client_id"] = AppConstants.clientId;
      }

      ///Rest Api call happens here
      var response = await dio.get(
        customUrl ?? apiUrl,
        options: Options(
          responseType: ResponseType.plain,
        ),
        queryParameters: queryParams,
      );

      /// Result will be converted to string.
      String result = response.data.toString();

      ///Return a json in string format
      return result;
    } catch (ex) {
      rethrow;
    }
  }
}
