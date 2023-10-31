import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final formatterNumber = NumberFormat.compactCurrency(
      symbol: '',
      locale: 'en',
      decimalDigits: decimals,
    ).format(number);

    return formatterNumber;
  }
}
