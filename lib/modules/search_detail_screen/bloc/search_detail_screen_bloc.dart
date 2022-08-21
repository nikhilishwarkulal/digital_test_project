import 'package:digitaltestproject/domain/faviourate_event/favourite_data_source.dart';
import 'package:digitaltestproject/modules/search_detail_screen/view_model/search_detail_argument_model.dart';
import 'package:digitaltestproject/modules/search_detail_screen/view_model/search_detail_screen_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_detail_screen_event.dart';
part 'search_detail_screen_state.dart';

class SearchDetailScreenBloc
    extends Bloc<SearchDetailScreenEvent, SearchDetailScreenState> {
  final FavouriteDataSourceImpl _favouriteDataSourceImpl;
  SearchDetailScreenBloc(this._favouriteDataSourceImpl)
      : super(const SearchDetailScreenLoading()) {
    on<SearchDetailScreenArgumentUpdatedEvent>(_onArgumentUpdated);
    on<SearchDetailScreenFavouriteEvent>(_onFavouriteTapped);
  }

  void _onFavouriteTapped(SearchDetailScreenFavouriteEvent event,
      Emitter<SearchDetailScreenState> emit) {
    ///[event.viewModel.isFavourite check if the current state is favourite]
    if (event.viewModel.isFavourite) {
      ///delete from the hive storage because toggle
      ///will make it as unfavourite
      _favouriteDataSourceImpl.deleteFromFavourite(event.viewModel.id);
    } else {
      ///add to hive storage because toggle will make it
      ///favourite
      _favouriteDataSourceImpl.saveAsFavourite(event.viewModel.id, true);
    }

    ///just update the view model so can be rendered in detail screen
    emit(SearchDetailScreenListLoaded(event.viewModel.favouriteToggle()));
  }

  void _onArgumentUpdated(SearchDetailScreenArgumentUpdatedEvent event,
      Emitter<SearchDetailScreenState> emit) async {
    ///This event is triggered when mapping argument to view model. Will
    ///be called on post frame call back in screen.
    emit(SearchDetailScreenListLoaded(
      SearchDetailScreenViewModel.fromArgumentModel(
        event.argumentModel,
      ),
    ));
  }
}
