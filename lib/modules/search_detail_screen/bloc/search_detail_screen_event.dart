part of 'search_detail_screen_bloc.dart';

abstract class SearchDetailScreenEvent extends Equatable {
  const SearchDetailScreenEvent();
}

///[SearchDetailScreenArgumentUpdatedEvent] event to move argument model
///to View model
class SearchDetailScreenArgumentUpdatedEvent extends SearchDetailScreenEvent {
  final SearchDetailScreenArgumentModel argumentModel;

  const SearchDetailScreenArgumentUpdatedEvent(this.argumentModel);

  @override
  List<Object?> get props => [argumentModel];
}

///[SearchDetailScreenFavouriteEvent] event to toggle in detail screen
class SearchDetailScreenFavouriteEvent extends SearchDetailScreenEvent {
  final SearchDetailScreenViewModel viewModel;
  const SearchDetailScreenFavouriteEvent(this.viewModel);

  @override
  List<Object?> get props => [viewModel];
}
