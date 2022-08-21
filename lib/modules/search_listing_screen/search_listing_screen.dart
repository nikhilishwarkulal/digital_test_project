import 'package:digitaltestproject/common/app_routes.dart';
import 'package:digitaltestproject/common/widgets/digital_error_screen/digital_error_screen.dart';
import 'package:digitaltestproject/common/widgets/digital_loading_screen/digital_error_screen.dart';
import 'package:digitaltestproject/domain/faviourate_event/favourite_data_source.dart';
import 'package:digitaltestproject/domain/geeks_event/usecases/geeks_event_use_cases.dart';
import 'package:digitaltestproject/injection.dart';
import 'package:digitaltestproject/modules/search_detail_screen/view_model/search_detail_argument_model.dart';
import 'package:digitaltestproject/modules/search_listing_screen/bloc/search_listing_screen_bloc.dart';
import 'package:digitaltestproject/modules/search_listing_screen/widgets/search_listing_appbar.dart';
import 'package:digitaltestproject/modules/search_listing_screen/widgets/search_listing_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListingScreen extends StatefulWidget {
  const SearchListingScreen({Key? key}) : super(key: key);

  @override
  State<SearchListingScreen> createState() => _SearchListingScreenState();
}

class _SearchListingScreenState extends State<SearchListingScreen> {
  final SearchListingScreenBloc bloc = SearchListingScreenBloc(
    inject<GeeksEventUseCasesImpl>(),
    inject<FavouriteDataSourceImpl>(),
  );
  @override
  void initState() {
    super.initState();

    /// Make status bar color white to match with design
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    /// Make an API call inside with empty query to show some result
    /// instead of showing empty screen.
    bloc.add(const SearchListingScreenSearchQueryEnteredEvent(""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchListingAppBar(
        onChanged: (query) {
          /// Make an API call inside the bloc based on query
          bloc.add(SearchListingScreenSearchQueryEnteredEvent(query));
        },
      ),
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case SearchListingScreenLoading:

                /// Show Loading screen when user makes an Type in search box
                return const DigitalLoadingScreen();
              case SearchListingScreenListLoaded:

                /// Show Listing screen if API has given some data
                return SearchListingBody(
                  loadedState: state as SearchListingScreenListLoaded,
                  onTap: onCellTapped,
                );
              case SearchListingScreenEmpty:

                /// Show Empty screen if search is empty
                return const DigitalEmptyScreen();
              default:

                /// Show loading of any other state is shown
                return const DigitalLoadingScreen();
            }
          }),
    );
  }

  ///[onCellTapped] event of an cell Tapped in search Listing.
  ///[index] Index of cell
  ///[SearchListingScreenListLoaded] The state containing all list of
  ///View model instance
  void onCellTapped(
      int index, SearchListingScreenListLoaded loadedState) async {
    await Navigator.pushNamed(
      context,
      AppRoutes.searchDetailScreen,
      arguments: SearchDetailScreenArgumentModel.fromListingModel(
        loadedState.uiList.elementAt(index),
      ),
    );

    /// Make status bar color white to match with design
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    /// Update the listView based on Favoruite action done in
    /// Detail screen
    bloc.add(SearchListingScreenUpdateFavouriteEvent(loadedState.uiList));
  }
}
