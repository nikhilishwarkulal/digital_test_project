import 'package:digitaltestproject/common/widgets/digital_loading_screen/digital_error_screen.dart';
import 'package:digitaltestproject/domain/faviourate_event/favourite_data_source.dart';
import 'package:digitaltestproject/injection.dart';
import 'package:digitaltestproject/modules/search_detail_screen/bloc/search_detail_screen_bloc.dart';
import 'package:digitaltestproject/modules/search_detail_screen/view_model/search_detail_argument_model.dart';
import 'package:digitaltestproject/modules/search_detail_screen/widgets/search_detail_appbar.dart';
import 'package:digitaltestproject/modules/search_detail_screen/widgets/search_detail_appbar_widget.dart';
import 'package:digitaltestproject/modules/search_detail_screen/widgets/search_detail_body.dart';
import 'package:digitaltestproject/modules/search_listing_screen/search_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[SearchDetailScreen] will be shown when cell item is tapped
///from [SearchListingScreen]
class SearchDetailScreen extends StatefulWidget {
  const SearchDetailScreen({Key? key}) : super(key: key);

  @override
  State<SearchDetailScreen> createState() => _SearchDetailScreenState();
}

class _SearchDetailScreenState extends State<SearchDetailScreen> {
  final SearchDetailScreenBloc bloc = SearchDetailScreenBloc(
    inject<FavouriteDataSourceImpl>(),
  );

  @override
  void initState() {
    super.initState();

    ///Make the screen status bar dark
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    ///Post frame call back will be called when first frame is rendered so
    ///Once First frame is rendered we take the argument and render in
    ///detail way
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ///Get data from argument
      SearchDetailScreenArgumentModel model = ModalRoute.of(context)
          ?.settings
          .arguments as SearchDetailScreenArgumentModel;

      ///Map the data to view Model
      bloc.add(SearchDetailScreenArgumentUpdatedEvent(model));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchDetailScreenBloc, SearchDetailScreenState>(
          bloc: bloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case SearchDetailScreenListLoaded:

                ///[SearchDetailBody] will be shown when the data is mapped
                ///from argument model to viewModel.
                return SearchDetailBody(
                  state: state as SearchDetailScreenListLoaded,
                );
              default:

                ///[DigitalLoadingScreen] will be shown as fall back screen.
                return const DigitalLoadingScreen();
            }
          }),
      appBar: SearchDetailAppBar(
        getTitleWidget: () {
          ///[SearchDetailAppBar] will also be rendered since appbar will have
          ///Dynamic Fav Icon and Dynamic text
          return BlocBuilder<SearchDetailScreenBloc, SearchDetailScreenState>(
              bloc: bloc,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case SearchDetailScreenListLoaded:

                    ///[SearchDetailAppbarWidget] appBar will be shown
                    ///once argument View model is mapped with
                    ///View model
                    return SearchDetailAppbarWidget(
                      state: state as SearchDetailScreenListLoaded,
                      onTap: () => bloc.add(
                        ///[SearchDetailScreenFavouriteEvent] will be triggered
                        ///To make change is favourite
                        SearchDetailScreenFavouriteEvent(state.item),
                      ),
                    );
                  default:

                    ///[SizedBox] is shown before argument is mapped to viewmodel
                    return const SizedBox();
                }
              });
        },
      ),
    );
  }
}
