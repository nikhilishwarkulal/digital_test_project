import 'package:intl/intl.dart';

class DateTimeHelper {
  ///[DateTime] Date Time taken as argument
  ///[String] returns [Wed, 02 JAN 2020 12:20 AM] format.
  static String getBestDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    return DateFormat('EEE, dd MMM yyyy h:mm a').format(dateTime.toLocal());
  }
}
