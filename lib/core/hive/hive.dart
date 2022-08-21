import 'package:hive/hive.dart';

///[CustomStorage] is a abstract class created for
///general Implementation. Any storage can be used just
///By implementing Custom Storage.
abstract class CustomStorage {
  ///Put The data to storage
  void put(dynamic key, dynamic value);

  ///Get The data to storage
  dynamic get(dynamic key);

  ///Delete The data from storage
  void delete(dynamic key);
}

///[CustomStorageHiveImpl] Hive storage is used make
///local caching of data. Since hive is much more faster
///Compared to Other data store
class CustomStorageHiveImpl extends CustomStorage {
  CustomStorageHiveImpl({required this.box});
  Box box;
  @override
  dynamic get(key) {
    ///Put The data to hive
    return box.get(key);
  }

  @override
  void put(key, value) {
    ///Get The data from hive
    box.put(key, value);
  }

  @override
  void delete(key) {
    ///Delete The data from hive
    box.delete(key);
  }
}
