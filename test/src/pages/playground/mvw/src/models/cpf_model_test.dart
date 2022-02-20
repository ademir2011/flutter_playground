import 'package:flutter_playground/src/pages/playground/mvw/src/models/cpf_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('cpf model ...', (tester) async {
    var cpfModel1 = CpfModel(value: '06850217429');
    var cpfModel2 = CpfModel(value: '00000000000');
    var cpfModel3 = CpfModel(value: '12315158181');

    var cpfModel4 = CpfModel(value: cpfModel1.generate());

    if (cpfModel4.isValid() && cpfModel1.isValid() && !cpfModel2.isValid() && !cpfModel3.isValid()) {
      print('PASSOU NOS TESTES');
    } else {
      print('NÂO PASSOU NOS TESTES !!!!!');
    }
  });
}
