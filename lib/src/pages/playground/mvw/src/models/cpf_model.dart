class CpfModel {
  final String value;
  CpfModel({
    required this.value,
  });

  int _calculateSum(int amountDigitCheck) {
    amountDigitCheck += 1;
    var sum = 0;
    value.split('').getRange(0, amountDigitCheck - 1).toList().asMap().forEach((key, value) {
      sum += (int.parse(value) * (amountDigitCheck - key));
    });
    return sum;
  }

  bool _checkDigit(int sum, int digitPosition) {
    return (sum * 10) % 11 == int.parse(value.split('')[digitPosition]);
  }

  bool isValid() {
    if (value.split('').every((element) => element == value.split('')[0])) {
      return false;
    }
    return _checkDigit(_calculateSum(9), 9) && _checkDigit(_calculateSum(10), 10);
  }
}
