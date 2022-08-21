import 'package:digitaltestproject/domain/faviourate_event/favourite_data_source.dart';
import 'package:digitaltestproject/domain/geeks_event/usecases/geeks_event_use_cases.dart';
import 'package:get_it/get_it.dart';

GetIt inject = GetIt.instance;

//[GetIt] Injection
void injectRegistry() {
  inject.registerFactory(() => GeeksEventUseCasesImpl());
  inject.registerFactory(() => FavouriteDataSourceImpl());
}
