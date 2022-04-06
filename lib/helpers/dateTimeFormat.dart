import 'package:intl/intl.dart';

String readTimestamp(int timestamp) {
  var time = DateTime.fromMillisecondsSinceEpoch(timestamp);

  var dateTime24 = DateFormat('dd/MM/yyyy, HH:mm a').format(time);

  return dateTime24;
}
