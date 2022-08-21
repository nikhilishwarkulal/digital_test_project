import 'package:digitaltestproject/domain/faviourate_event/favourite_data_source.dart';
import 'package:digitaltestproject/domain/geeks_event/usecases/geeks_event_use_cases.dart';
import 'package:digitaltestproject/modules/search_listing_screen/bloc/search_listing_debouncer.dart';
import 'package:digitaltestproject/modules/search_listing_screen/view_model/search_listing_screen_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_listing_screen_event.dart';
part 'search_listing_screen_state.dart';

class SearchListingScreenBloc
    extends Bloc<SearchListingScreenEvent, SearchListingScreenState> {
  final GeeksEventUseCases _apiService;
  final FavouriteDataSourceImpl _favouriteDataSourceImpl;

  SearchListingScreenBloc(this._apiService, this._favouriteDataSourceImpl)
      : super(const SearchListingScreenLoading()) {
    on<SearchListingScreenSearchQueryEnteredEvent>(_onSearchQueryEntered);
    on<SearchListingScreenUpdateFavouriteEvent>(_onFavouriteUpdated);
  }

  void _onSearchQueryEntered(SearchListingScreenSearchQueryEnteredEvent event,
      Emitter<SearchListingScreenState> emit) async {
    ///[SearchListingScreenLoading] emit as loading until Api call is finished
    emit(const SearchListingScreenLoading());

    ///[SearchListingScreenLoading] get response from API as per debounce logic
    await SearchListingDeBouncer().getSearchData(
      event.searchQuery,
      _apiService,
      (data) {
        if (data.events!.isEmpty) {
          ///[SearchListingScreenEmpty] if the data is empty.
          emit(const SearchListingScreenEmpty());
          return;
        }

        ///[SearchListingScreenEmpty] emit data if api gives some data.
        emit(SearchListingScreenListLoaded(
          List<SearchListingScreenViewModel>.generate(
            data.events?.length ?? 0,
            (index) {
              return SearchListingScreenViewModel.fromDataModel(
                data.events!.elementAt(index),
                _favouriteDataSourceImpl.checkIfFavourite(
                  data.events!.elementAt(index).id.toString(),
                ),
              );
            },
          ),
        ));
      },
    );
  }

  ///[_onFavouriteUpdated] Rerender List based on Favourite Data from
  ///Hive storage.
  void _onFavouriteUpdated(SearchListingScreenUpdateFavouriteEvent event,
      Emitter<SearchListingScreenState> emit) async {
    emit(
      SearchListingScreenListLoaded(
        List<SearchListingScreenViewModel>.generate(
          event.list.length,
          (index) {
            return event.list.elementAt(index).updateFavourite(
                  _favouriteDataSourceImpl.checkIfFavourite(
                    event.list.elementAt(index).id,
                  ),
                );
          },
        ),
      ),
    );
  }
}
