import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/enum/page_enum.dart';

class PageStore extends ChangeNotifier {
  PageEnum _pageEnum = PageEnum.generate;

  PageEnum get pageEnum => _pageEnum;

  void generatedPressed() {
    _pageEnum = PageEnum.generate;
    notifyListeners();
  }

  void validatePressed() {
    _pageEnum = PageEnum.validate;
    notifyListeners();
  }
}
