class Routes {
  Routes._();

  static const String splash = '/';
  static const String productDetail = '/product-detail';
  static const String producerDetail = '/producer-detail';

  //Navigation manager
  static const String navigationManager = '/navigation-manager';
  static const String home = '$navigationManager/home';
  static const String cart = '$navigationManager/cart';
  static const String producers = '$navigationManager/producers';
  static const String help = '$navigationManager/help';
}
