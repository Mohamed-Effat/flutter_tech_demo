import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class IntlMixin {
  String formatDate(DateTime oldDate) {
    initializeDateFormatting('ar_SA', null);
    String newDate =new DateFormat('EE, d LLLL','ar-SA').add_jm().format(oldDate);
    return newDate;
  }
}