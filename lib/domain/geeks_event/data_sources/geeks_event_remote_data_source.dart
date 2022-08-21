import 'package:digitaltestproject/common/app_constants.dart';
import 'package:digitaltestproject/core/dio/dio.dart';
import 'package:digitaltestproject/core/exception/exception.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_argument_data.dart';

import '../models/geeks_event_data.dart';

/// Interface for Chat Data remote data source.
abstract class GeeksEventDataSource {
  /// Call API to get the Chat Screen.
  /// [Future<GeeksEventData>] to handle the Failure or result data.
  Future<GeeksEventData> getEventData(
      {required GeeksEventArgumentData argumentModel});
}

/// [GeeksEventRemoteDataSourceImpl] will contain the [GeeksEventDataSource] implementation.
class GeeksEventRemoteDataSourceImpl implements GeeksEventDataSource {
  CustomDio? customDio;

  GeeksEventRemoteDataSourceImpl({CustomDio? dio}) {
    if (dio == null) {
      customDio = CustomDioImpl(baseUrl: AppConstants.baseUrl);
    } else {
      customDio = dio;
    }
  }

  /// Call API to get the Search Listing Items.
  ///
  /// [Future<GeeksEventData>] to handle the Failure or result data.
  @override
  Future<GeeksEventData> getEventData(
      {required GeeksEventArgumentData argumentModel}) async {
    try {
      final String? result = await customDio?.callApi(
        customUrl: AppConstants.baseUrl,
        queryParams: {
          "q": argumentModel.query,
        },
      );
      if (result == null) {
        throw ServerException.failure();
      }
      return GeeksEventData.fromJson(result);
    } catch (ex) {
      throw ServerException.failure();
    }
  }
}
