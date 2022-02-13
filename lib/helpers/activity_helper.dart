import 'package:flutter_playground/enums/activity_type_enum.dart';

class ActivityHelper {
  static final titles = [
    'Animações',
    'Leitura de Mockup',
    'Playground',
  ];
  static final urlIcons = [
    'lib/assets/images/icons/Icon awesome-running.png',
    'lib/assets/images/icons/Icon awesome-glasses.png',
    'lib/assets/images/icons/Icon material-toys.png',
  ];
  static getTitle(ActivityTypeEnum type) {
    return titles[type.index];
  }

  static getIconName(ActivityTypeEnum type) {
    return urlIcons[type.index];
  }
}
