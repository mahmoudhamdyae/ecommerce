import 'package:ecommerce/domain/models/product.dart';

import '../../presentation/resources/assets_manager.dart';

class Marka {
  String name;
  String image;
  List<Product> products;

  Marka(this.name, this.image, this.products);

  static List<Marka> getMockMarkat() {
    return [
      Marka('معدات كهربية', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات يدوية', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات ليثيوم', ImageAssets.test, Product.getMockProducts()),
      Marka('أدوات السلامة', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات كهربية', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات كهربية', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات كهربية', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات كهربية', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات كهربية', ImageAssets.test, Product.getMockProducts()),
      Marka('معدات كهربية', ImageAssets.test, Product.getMockProducts()),
    ];
  }
}