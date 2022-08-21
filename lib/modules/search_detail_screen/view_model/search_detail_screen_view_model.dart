import 'package:digitaltestproject/modules/search_detail_screen/view_model/search_detail_argument_model.dart';
import 'package:equatable/equatable.dart';

class SearchDetailScreenViewModel extends Equatable {
  final String title;
  final String city;
  final String imageUrl;
  final bool isFavourite;
  final String dateTimeInString;
  final String id;

  const SearchDetailScreenViewModel({
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.isFavourite,
    required this.city,
    required this.dateTimeInString,
  });

  factory SearchDetailScreenViewModel.fromArgumentModel(
      SearchDetailScreenArgumentModel model) {
    return SearchDetailScreenViewModel(
      city: model.city,
      dateTimeInString: model.dateTimeInString,
      id: model.id,
      imageUrl: model.imageUrl,
      isFavourite: model.isFavourite,
      title: model.title,
    );
  }

  SearchDetailScreenViewModel favouriteToggle() {
    return SearchDetailScreenViewModel(
      title: title,
      isFavourite: !isFavourite,
      imageUrl: imageUrl,
      id: id,
      city: city,
      dateTimeInString: dateTimeInString,
    );
  }

  @override
  List<Object?> get props => [id, isFavourite];

  @override
  bool? get stringify => true;
}
