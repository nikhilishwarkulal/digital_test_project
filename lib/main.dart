import 'package:digitaltestproject/common/app_constants.dart';
import 'package:digitaltestproject/common/app_routes.dart';
import 'package:digitaltestproject/injection.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Inject GetIt registry
  injectRegistry();

  ///Define Path for Application Directory
  final appDocumentDirectory = await getApplicationDocumentsDirectory();

  ///Initialise the Hive Path to applicationDirectory.
  Hive.init(appDocumentDirectory.path);

  ///Initialise the Box.
  await Hive.openBox(AppConstants.favouriteDataSource);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital14',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.searchListingScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
