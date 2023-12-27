import '../../presentation/resources/assets_manager.dart';

class Product {
  String name;
  String image;
  int percent;
  double price;

  Product(this.name, this.image, this.percent, this.price);

  static List<Product> getMockProducts() {
    return [
      Product('معدات كهربية', ImageAssets.test, 39, 214.07),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07),
      Product('معدات كهربية', ImageAssets.test, 39, 214.07),
    ];
  }
}