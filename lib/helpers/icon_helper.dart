enum IconName {
  target,
  github,
  masterClassLogo,
  logo,
  moonDark,
  moonLight,
  whatsapp,
  githubAlt,
  instagram,
  facebook,
  running,
  glasses,
  toys,
}

class IconHelper {
  static final iconsData = [
    'lib/assets/images/icons/Icon feather-target.png',
    'lib/assets/images/icons/Icon awesome-github.png',
    'lib/assets/images/masterclass_logo.png',
    'lib/assets/images/logo.png',
    'lib/assets/images/icons/Icon awesome-moon_dark.png',
    'lib/assets/images/icons/Icon awesome-moon_light.png',
    'lib/assets/images/icons/Icon ionic-logo-whatsapp.png',
    'lib/assets/images/icons/Icon awesome-github-alt.png',
    'lib/assets/images/icons/Icon awesome-instagram.png',
    'lib/assets/images/icons/Icon awesome-facebook-f.png',
    'lib/assets/images/icons/Icon awesome-running.png',
    'lib/assets/images/icons/Icon awesome-glasses.png',
    'lib/assets/images/icons/Icon material-toys.png',
  ];

  static getPath(IconName iconName) {
    return iconsData[iconName.index];
  }
}
