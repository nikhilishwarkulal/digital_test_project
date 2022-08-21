part of 'search_listing_screen_bloc.dart';

abstract class SearchListingScreenState extends Equatable {
  const SearchListingScreenState();
}

///[SearchListingScreenLoading] loading screen state
class SearchListingScreenLoading extends SearchListingScreenState {
  const SearchListingScreenLoading();

  @override
  List<SearchListingScreenViewModel?> get props => [];
}

///[SearchListingScreenEmpty] empty screen state
class SearchListingScreenEmpty extends SearchListingScreenState {
  const SearchListingScreenEmpty();

  @override
  List<SearchListingScreenViewModel?> get props => [];
}

///[SearchListingScreenListLoaded] loaded with data screen state
class SearchListingScreenListLoaded extends SearchListingScreenState {
  final List<SearchListingScreenViewModel> uiList;

  const SearchListingScreenListLoaded(this.uiList);

  @override
  List<SearchListingScreenViewModel> get props => uiList;
}
