import 'package:digitaltestproject/modules/search_listing_screen/bloc/search_listing_screen_bloc.dart';
import 'package:digitaltestproject/modules/search_listing_screen/widgets/search_listing_cell.dart';
import 'package:flutter/material.dart';

///[SearchListingBody] loads this page when there are items
///that to be displayed in the screen
class SearchListingBody extends StatelessWidget {
  const SearchListingBody(
      {Key? key, required this.loadedState, required this.onTap})
      : super(key: key);

  ///[loadedState] will contain list of viewModel Items need to be rendered
  ///in screen.
  final SearchListingScreenListLoaded loadedState;

  ///[onTap] on tap of cell, called from screen will also notify the screen with
  ///[index] and [loadState]
  final Function(int index, SearchListingScreenListLoaded loadedState) onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: loadedState.uiList.length,
      itemBuilder: (context, index) {
        return SearchListingCell(
          onTap: () async {
            onTap(index, loadedState);
          },
          imageUrl: loadedState.uiList.elementAt(index).imageUrl,
          date: loadedState.uiList.elementAt(index).dateTimeInString,
          place: loadedState.uiList.elementAt(index).city,
          title: loadedState.uiList.elementAt(index).title,
          isFavourite: loadedState.uiList.elementAt(index).isFavourite,
        );
      },
    );
  }
}
