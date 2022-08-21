import 'package:digitaltestproject/modules/search_detail_screen/view_model/search_detail_screen_view_model.dart';
import 'package:digitaltestproject/modules/search_listing_screen/view_model/search_listing_screen_view_model.dart';
import 'package:equatable/equatable.dart';

class SearchDetailScreenArgumentModel extends Equatable {
  final String title;
  final String city;
  final String imageUrl;
  final bool isFavourite;
  final String dateTimeInString;
  final String id;

  const SearchDetailScreenArgumentModel({
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.isFavourite,
    required this.city,
    required this.dateTimeInString,
  });

  factory SearchDetailScreenArgumentModel.fromListingModel(
      SearchListingScreenViewModel model) {
    return SearchDetailScreenArgumentModel(
      city: model.city,
      dateTimeInString: model.dateTimeInString,
      id: model.id,
      imageUrl: model.imageUrl,
      isFavourite: model.isFavourite,
      title: model.title,
    );
  }

  factory SearchDetailScreenArgumentModel.fromViewModel(
      SearchDetailScreenViewModel model,
      {bool toggle = false}) {
    return SearchDetailScreenArgumentModel(
      city: model.city,
      dateTimeInString: model.dateTimeInString,
      id: model.id,
      imageUrl: model.imageUrl,
      isFavourite: toggle ? !model.isFavourite : model.isFavourite,
      title: model.title,
    );
  }

  @override
  List<Object?> get props => [id, isFavourite];

  @override
  bool? get stringify => true;
}
