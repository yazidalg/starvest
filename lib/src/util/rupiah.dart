import 'package:intl/intl.dart';

class RupiahUtils {
  static String beRupiah(int number) {
    return NumberFormat.currency(locale: "id", symbol: "Rp ", decimalDigits: 0)
        .format(number);
  }

  static int beNumber(String fancyNumber) {
    final format =
        NumberFormat.currency(locale: "id", symbol: "Rp ", decimalDigits: 0);
    return format.parse(fancyNumber).toInt();
  }

  static int _puluhanRibuFunction(int number) {
    return (number / 10000).ceil() * 10000;
  }

  static int _limaRibuFunction(int number) {
    return (number / 10000).ceil() * 10000 - 5000;
  }

  static int _ratusanRibuFunction(int number) {
    return (number / 100000).ceil() * 100000;
  }

  static int _limaPuluhRibuFunction(int number) {
    return (number / 100000).ceil() * 100000 - 50000;
  }

  static List<int> roundMoney(int number) {
    Set<int> numberList = {};
    List<int> result = [];

    int limaRibu = _limaRibuFunction(number);
    if (limaRibu > number) {
      numberList.add(limaRibu);
    }

    int puluhanRibu = _puluhanRibuFunction(number);
    if (puluhanRibu != number) {
      numberList.add(puluhanRibu);
    }

    int limaPuluhRibu = _limaPuluhRibuFunction(number);
    if (limaPuluhRibu > number) {
      numberList.add(limaPuluhRibu);
    }

    int ratusanRibu = _ratusanRibuFunction(number);
    if (ratusanRibu != number) {
      numberList.add(ratusanRibu);
    }

    if (numberList.length < 4) {
      numberList.add(puluhanRibu + 10000);
    }

    if (numberList.length < 4) {
      numberList.add(puluhanRibu + 20000);
    }

    if (numberList.length < 4) {
      numberList.add(puluhanRibu + 50000);
    }

    if (numberList.length < 4) {
      numberList.add(ratusanRibu + 100000);
    }
    result = numberList.toList();
    result.sort();

    return result;
  }
}
