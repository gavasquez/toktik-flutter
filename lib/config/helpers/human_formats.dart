// Static singnifca que no tenga que crear un instancia para llamar los metodos
import 'package:intl/intl.dart';

class HumanFormast {
  static String humanReadbleNumber(double number) {
    final formatterNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(number);
    return formatterNumber;
  }
}
