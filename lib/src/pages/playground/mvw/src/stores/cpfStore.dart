import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/enum/page_enum.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/models/cpf_model.dart';

class CpfStore {
  final inputCpfController = TextEditingController();

  final CpfModel cpfModel = CpfModel();
  bool isValid = false;

  String _fommatedCpf(String valueNoFormmated) {
    final valueNFList = valueNoFormmated.split('');
    return '${valueNFList.getRange(0, 3).join()}.${valueNFList.getRange(3, 6).join()}.${valueNFList.getRange(6, 9).join()}-${valueNFList.getRange(9, 11).join()}';
  }

  void actionPressButton({required PageEnum pageType}) {
    if (pageType == PageEnum.generate) {
      inputCpfController.text = _fommatedCpf(cpfModel.generate());
    } else if (pageType == PageEnum.validate) {
      cpfModel.value = inputCpfController.text;
      inputCpfController.text = cpfModel.isValid() ? 'CPF VÁLIDO' : 'CPF INVÁLIDO';
    }
  }
}
