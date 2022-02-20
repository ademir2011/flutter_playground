import 'dart:math';

class CpfModel {
  String value;

  CpfModel({
    this.value = '',
  });

  int _calculateSum(int amountDigitCheck, String value) {
    amountDigitCheck += 1;
    var sum = 0;
    value.split('').getRange(0, amountDigitCheck - 1).toList().asMap().forEach((key, value) {
      sum += (int.parse(value) * (amountDigitCheck - key));
    });
    return sum;
  }

  int _getCheckDigitByPosition(int sum) {
    return (sum * 10) % 11;
  }

  bool _checkDigit(int sum, int digitPosition) {
    return _getCheckDigitByPosition(sum) == int.parse(value.split('')[digitPosition]);
  }

  bool isValid() {
    value = value.replaceAll('.', '');
    value = value.replaceAll('-', '');

    if (value.split('').every((element) => element == value.split('')[0])) {
      return false;
    }

    return _checkDigit(_calculateSum(9, value), 9) && _checkDigit(_calculateSum(10, value), 10);
  }

  String generate() {
    final newCpf = List.generate(9, (index) => Random().nextInt(10).toString());
    newCpf.add(_getCheckDigitByPosition(_calculateSum(9, newCpf.join())).toString());
    newCpf.add(_getCheckDigitByPosition(_calculateSum(10, newCpf.join())).toString());
    return newCpf.join();
  }
}
