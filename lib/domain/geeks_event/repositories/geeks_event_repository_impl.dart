import 'package:digitaltestproject/core/exception/exception.dart';
import 'package:digitaltestproject/domain/geeks_event/data_sources/geeks_event_remote_data_source.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_argument_data.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_data.dart';
import 'package:either_dart/either.dart';

/// Interface for [GeeksEventRepository] repository.
abstract class GeeksEventRepository {
  /// Call API to get the Search Listing Screen.
  ///
  /// [Either<ServerException, GeeksEventData>] to handle the Failure or result data.
  Future<Either<ServerException, GeeksEventData>> getEventData(
      {required GeeksEventArgumentData argumentModel});
}

/// [GeeksEventRepositoryImpl] will contain the [GeeksEventRepository] implementation.
class GeeksEventRepositoryImpl implements GeeksEventRepository {
  GeeksEventDataSource? eventRemoteDataSource;

  /// Dependence injection via constructor
  GeeksEventRepositoryImpl({GeeksEventDataSource? remoteDataSource}) {
    if (remoteDataSource == null) {
      eventRemoteDataSource = GeeksEventRemoteDataSourceImpl();
    } else {
      eventRemoteDataSource = remoteDataSource;
    }
  }

  /// Call API to get the chat Screen.
  ///
  /// [GeeksEventArgumentData] is the query that user entered in search.
  /// [Either<ServerException, GeeksEventData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, GeeksEventData>> getEventData(
      {required GeeksEventArgumentData argumentModel}) async {
    try {
      final splashResult = await eventRemoteDataSource?.getEventData(
          argumentModel: argumentModel);
      return Right(splashResult!);
    } on ServerException catch (error) {
      return Left(error);
    }
  }
}
