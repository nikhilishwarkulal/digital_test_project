import 'package:digitaltestproject/modules/search_detail_screen/search_detail_screen.dart';
import 'package:digitaltestproject/modules/search_listing_screen/search_listing_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Route name constants
  static const String searchListingScreen = '/searchListingScreen';
  static const String searchDetailScreen = '/searchDetailScreen';

  /// The map used to define our routes, needs to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      searchListingScreen: (context) => const SearchListingScreen(),
      searchDetailScreen: (context) => const SearchDetailScreen(),
    };
  }
}
