import 'package:flutter_playground/enums/activity_type_enum.dart';

class ActivityHelper {
  static final titles = [
    'Animações',
    'Leitura de Mockup',
    'Playground',
  ];

  static getTitle(ActivityTypeEnum type) {
    return titles[type.index];
  }
}
