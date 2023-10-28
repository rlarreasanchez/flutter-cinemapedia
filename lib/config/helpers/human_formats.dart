import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      symbol: '',
      locale: 'en',
      decimalDigits: 0,
    ).format(number);

    return formatterNumber;
  }
}
