enum AssetsApp {
  logo('assets/img/logo.png'),
  logoIcon('assets/img/logo-icon.png'),
  menu('assets/img/menu.png'),
  configSvg('assets/svg/config.svg'),
  logoAppleSvg('assets/svg/logo-apple.svg'),
  logoFbSvg('assets/svg/logo-fb.svg'),
  logoGgSvg('assets/svg/logo-gg.svg'),
  userSvg('assets/svg/user.svg'),
  settingSvg('assets/svg/setting.svg'),
  avatar('assets/img/avatar.png'),
  calendar('assets/img/calendar.png');

  const AssetsApp(this.path);
  final String path;
}
