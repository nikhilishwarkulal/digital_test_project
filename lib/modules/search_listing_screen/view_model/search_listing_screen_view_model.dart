import 'package:digitaltestproject/common/date_time_helper.dart';
import 'package:digitaltestproject/domain/geeks_event/models/geeks_event_data.dart';
import 'package:equatable/equatable.dart';

///[SearchListingScreenViewModel] will save the state of the current screen
class SearchListingScreenViewModel extends Equatable {
  final String title;
  final String city;
  final String imageUrl;
  final bool isFavourite;
  final String dateTimeInString;
  final String id;

  const SearchListingScreenViewModel({
    required this.imageUrl,
    required this.id,
    required this.title,
    required this.isFavourite,
    required this.city,
    required this.dateTimeInString,
  });

  factory SearchListingScreenViewModel.fromDataModel(
      Event event, bool isFavourite) {
    return SearchListingScreenViewModel(
      city: event.venue?.displayLocation ?? "",
      dateTimeInString: DateTimeHelper.getBestDateTime(event.datetimeUtc),
      id: event.id.toString(),
      imageUrl: event.performers?.isEmpty ?? true
          ? ""
          : event.performers?.first.image ?? "",
      isFavourite: isFavourite,
      title: event.title ?? "",
    );
  }

  SearchListingScreenViewModel updateFavourite(bool isFavourite) {
    return SearchListingScreenViewModel(
      city: city,
      dateTimeInString: dateTimeInString,
      id: id,
      imageUrl: imageUrl,
      isFavourite: isFavourite,
      title: title,
    );
  }

  @override
  List<Object?> get props => [id, isFavourite];

  @override
  bool? get stringify => true;
}
