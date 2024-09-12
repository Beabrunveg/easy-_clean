enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Easy clean App Dev';
      case Flavor.prod:
        return 'Easy Clean App';
      default:
        return 'title';
    }
  }

}
