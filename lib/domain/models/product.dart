import '../../presentation/resources/assets_manager.dart';

class Product {
  String name;
  String image;
  int percent;
  double price;
  double rate;

  Product(this.name, this.image, this.percent, this.price, this.rate);

  static List<Product> getMockProducts() {
    return [
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07, 0),
    ];
  }
}