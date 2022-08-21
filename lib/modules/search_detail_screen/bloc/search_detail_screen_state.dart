part of 'search_detail_screen_bloc.dart';

abstract class SearchDetailScreenState extends Equatable {
  const SearchDetailScreenState();
}

///[SearchDetailScreenLoading] state to show loading screen in detail page
class SearchDetailScreenLoading extends SearchDetailScreenState {
  const SearchDetailScreenLoading();

  @override
  List<SearchDetailScreenViewModel?> get props => [];
}

///[SearchDetailScreenListLoaded] state to show data in the screen
///once argument model is mapped to view model.
class SearchDetailScreenListLoaded extends SearchDetailScreenState {
  final SearchDetailScreenViewModel item;

  const SearchDetailScreenListLoaded(this.item);

  @override
  List<SearchDetailScreenViewModel> get props => [item];
}
