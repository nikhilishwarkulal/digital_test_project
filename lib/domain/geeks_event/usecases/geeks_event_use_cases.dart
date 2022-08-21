import 'package:digitaltestproject/core/exception/exception.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_argument_data.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_data.dart';
import 'package:digitaltestproject/domain/geeks_event/repositories/geeks_event_repository_impl.dart';
import 'package:either_dart/either.dart';

/// Interface for [GeeksEventUseCases] cases.
abstract class GeeksEventUseCases {
  /// Call API to get the Search Listing Item.
  ///
  /// [Either<ServerException, GeeksEventData>] to handle the Failure or result data.
  Future<Either<ServerException, GeeksEventData>?> getEventData(
      {required GeeksEventArgumentData argumentModel});
}

/// [GeeksEventUseCasesImpl] will contain the [GeeksEventUseCases] implementation.
class GeeksEventUseCasesImpl implements GeeksEventUseCases {
  GeeksEventRepository? eventRepository;

  /// Dependence injection via constructor
  GeeksEventUseCasesImpl({GeeksEventRepository? repository}) {
    if (repository == null) {
      eventRepository = GeeksEventRepositoryImpl();
    } else {
      eventRepository = repository;
    }
  }

  /// Call API to get the Search Listing Item.
  ///
  /// [Either<ServerException, GeeksEventData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, GeeksEventData>?> getEventData(
      {required GeeksEventArgumentData argumentModel}) async {
    return await eventRepository?.getEventData(argumentModel: argumentModel);
  }
}
