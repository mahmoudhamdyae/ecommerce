import 'package:ecommerce/domain/models/home/salaries_products.dart';

class HomeData {
  int? status;
  String? message;
  Data? data;

  HomeData({this.status, this.message, this.data});

  HomeData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<LatestProducts>? latestProducts;
  List<SalariesProducts>? salariesProducts;
  List<Sliders>? sliders;
  List<CardsAds>? cardsAds;
  CardsAds? onePanner;
  List<Categories>? categories;
  String? favourites;
  String? card;

  Data(
      {this.latestProducts,
        this.salariesProducts,
        this.sliders,
        this.cardsAds,
        this.onePanner,
        this.categories,
        this.favourites,
        this.card});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['latest_products'] != null) {
      latestProducts = <LatestProducts>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(LatestProducts.fromJson(v));
      });
    }
    if (json['salaries_products'] != null) {
      salariesProducts = <SalariesProducts>[];
      json['salaries_products'].forEach((v) {
        salariesProducts!.add(SalariesProducts.fromJson(v));
      });
    }
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(new Sliders.fromJson(v));
      });
    }
    if (json['cards_ads'] != null) {
      cardsAds = <CardsAds>[];
      json['cards_ads'].forEach((v) {
        cardsAds!.add(new CardsAds.fromJson(v));
      });
    }
    onePanner = json['one_panner'] != null
        ? new CardsAds.fromJson(json['one_panner'])
        : null;
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    favourites = json['favourites'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.latestProducts != null) {
      data['latest_products'] =
          this.latestProducts!.map((v) => v.toJson()).toList();
    }
    if (this.salariesProducts != null) {
      data['salaries_products'] =
          this.salariesProducts!.map((v) => v.toJson()).toList();
    }
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    if (this.cardsAds != null) {
      data['cards_ads'] = this.cardsAds!.map((v) => v.toJson()).toList();
    }
    if (this.onePanner != null) {
      data['one_panner'] = this.onePanner!.toJson();
    }
    if (this.categories != null) {
      data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['favourites'] = this.favourites;
    data['card'] = this.card;
    return data;
  }
}

class LatestProducts {
  int? id;
  String? name;
  int? rate;
  int? oldPrice;
  String? cardImage;
  int? rateNum;
  int? discount;
  double? priceNew;
  bool? fav;

  LatestProducts(
      {this.id,
        this.name,
        this.rate,
        this.oldPrice,
        this.cardImage,
        this.rateNum,
        this.discount,
        this.priceNew,
        this.fav});

  LatestProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
    oldPrice = json['old_price'];
    cardImage = json['card_image'];
    rateNum = json['rate_num'];
    discount = json['discount'];
    priceNew = json['price_new'];
    fav = json['fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rate'] = this.rate;
    data['old_price'] = this.oldPrice;
    data['card_image'] = this.cardImage;
    data['rate_num'] = this.rateNum;
    data['discount'] = this.discount;
    data['price_new'] = this.priceNew;
    data['fav'] = this.fav;
    return data;
  }
}

class Sliders {
  int? id;
  String? name;
  String? desc;
  String? image;

  Sliders({this.id, this.name, this.desc, this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['image'] = this.image;
    return data;
  }
}

class CardsAds {
  int? id;
  String? name;
  String? image;

  CardsAds({this.id, this.name, this.image});

  CardsAds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}