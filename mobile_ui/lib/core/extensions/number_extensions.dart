import 'package:intl/intl.dart';

extension IntFormattingExtension on int {
  String toCurrency() {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    String formattedString = formatter.format(this);
    return formattedString.replaceFirst('Rp', 'Rp ');
  }
}

extension DayTextExtension on double {
  String getDayText() {
    final Map<int, String> dayMappings = {
      2: 'Mon',
      5: 'Tue',
      8: 'Wed',
      11: 'Thu',
      14: 'Fri',
      17: 'Sat',
      20: 'Sun',
    };

    final int intValue = toInt();
    return dayMappings[intValue] ?? '';
  }
}
