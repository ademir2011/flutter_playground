enum IconName {
  target,
  github,
}

class IconHelper {
  static final iconsData = [
    'lib/assets/images/icons/Icon feather-target.png',
    'lib/assets/images/icons/Icon awesome-github.png',
  ];

  static getPath(IconName iconName) {
    return iconsData[iconName.index];
  }
}
