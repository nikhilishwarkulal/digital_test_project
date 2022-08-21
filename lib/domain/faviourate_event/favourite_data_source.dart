import 'package:digitaltestproject/common/app_constants.dart';
import 'package:digitaltestproject/core/hive/hive.dart';
import 'package:hive/hive.dart';

///[FavouriteDataSource] will connect to DataStorage. Can be injected
///to Point to any OtherDataStorage if available.
abstract class FavouriteDataSource {
  void saveAsFavourite(String eventId, bool isFavourite);
  bool checkIfFavourite(String eventId);
  void deleteFromFavourite(String eventId);
}

///[FavouriteDataSourceImpl] will connect to HiveDataStorage.
class FavouriteDataSourceImpl extends FavouriteDataSource {
  late CustomStorage customStorage;
  FavouriteDataSourceImpl({CustomStorage? storage}) {
    if (storage == null) {
      customStorage = CustomStorageHiveImpl(
          box: Hive.box(AppConstants.favouriteDataSource));
    } else {
      customStorage = storage;
    }
  }

  ///[checkIfFavourite] check from HiveDataStorage.
  @override
  bool checkIfFavourite(String eventId) {
    bool? isFav = customStorage.get(eventId);
    if (isFav == null) return false;
    return isFav;
  }

  ///[deleteFromFavourite] delete from HiveDataStorage.
  @override
  void deleteFromFavourite(String eventId) {
    customStorage.delete(eventId);
  }

  ///[saveAsFavourite] save to HiveDataStorage.
  @override
  void saveAsFavourite(String eventId, bool isFavourite) {
    customStorage.put(eventId, isFavourite);
  }
}
