import 'package:intl/intl.dart';

extension CurrencyFormatter on double {
  String toCurrency() {
    final NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(this);
  }
}
