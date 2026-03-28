import 'package:intl/intl.dart';

final format = DateFormat.yMMMd();

class Information {
  Information({
    required this.name,
    required this.quantity,
    required this.price,
    required this.dateTime,
  });

  String name;
  int quantity;
  double price;
  DateTime dateTime;

  dynamic get formattedDate {
    return format.format(dateTime);
  }
}
