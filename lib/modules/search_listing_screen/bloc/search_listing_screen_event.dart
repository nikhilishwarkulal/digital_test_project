part of 'search_listing_screen_bloc.dart';

abstract class SearchListingScreenEvent extends Equatable {
  const SearchListingScreenEvent();
}

///[SearchListingScreenSearchQueryEnteredEvent] make and search call
///base on search query
class SearchListingScreenSearchQueryEnteredEvent
    extends SearchListingScreenEvent {
  final String searchQuery;

  const SearchListingScreenSearchQueryEnteredEvent(this.searchQuery);

  @override
  List<Object?> get props => [searchQuery];
}

///[SearchListingScreenUpdateFavouriteEvent] event to make some items in the
///list to favourite
class SearchListingScreenUpdateFavouriteEvent extends SearchListingScreenEvent {
  final List<SearchListingScreenViewModel> list;

  const SearchListingScreenUpdateFavouriteEvent(this.list);

  @override
  List<Object?> get props => [list];
}
