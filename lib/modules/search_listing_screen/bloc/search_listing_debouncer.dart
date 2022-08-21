import 'dart:async';

import 'package:digitaltestproject/core/exception/exception.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_argument_data.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_data.dart';
import 'package:digitaltestproject/domain/geeks_event/usecases/geeks_event_use_cases.dart';
import 'package:either_dart/either.dart';

const int _kDebounceDelayInSec = 1;

class SearchListingDeBouncer {
  ///[SearchListingDeBouncer._internal()] is a private constructor
  ///so cannot be called outside of this class
  SearchListingDeBouncer._internal();

  ///[_shared] is a private static member so this can be used everywhere.
  static final SearchListingDeBouncer _shared =
      SearchListingDeBouncer._internal();

  ///[SearchListingDeBouncer] we pass [_shared] so new instance will never
  ///be created
  factory SearchListingDeBouncer() {
    return _shared;
  }

  ///[timer] is used to maintain deBounce logic.
  Timer? timer;

  ///[getSearchData] will make an deBounce logic.
  Future<void> getSearchData(String searchString, GeeksEventUseCases apiService,
      Function(GeeksEventData) response) async {
    ///[Completer] is used so that [getSearchData] will be waited untill Timer
    ///and API is finished
    var c = Completer();

    ///Cancel the already running timer to make the API call again
    timer?.cancel();

    ///Make an API call after 1 Sec duration. So if user enters again
    ///timer is cancelled and restarted with new search query.
    timer = Timer(
      const Duration(seconds: _kDebounceDelayInSec),
      () async {
        ///Make and Api call and get the data as response.
        Either<ServerException, GeeksEventData>? data =
            await apiService.getEventData(
                argumentModel: GeeksEventArgumentData(query: searchString));
        if (data?.isRight ?? false) {
          ///Pass it as call back with response.
          response(data!.right);
        }

        ///Mark as APi is completed.
        c.complete();
      },
    );

    ///Make an API call after 1 Sec duration. So if user enters again
    ///timer is cancelled and restarted with new search query.
    return c.future;
  }
}
