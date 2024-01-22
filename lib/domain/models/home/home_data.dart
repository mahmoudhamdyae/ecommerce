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
  List<LatestProducts>? salariesProducts;
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
      salariesProducts = <LatestProducts>[];
      json['salaries_products'].forEach((v) {
        salariesProducts!.add(LatestProducts.fromJson(v));
      });
    }
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
    if (json['cards_ads'] != null) {
      cardsAds = <CardsAds>[];
      json['cards_ads'].forEach((v) {
        cardsAds!.add(CardsAds.fromJson(v));
      });
    }
    onePanner = json['one_panner'] != null
        ? CardsAds.fromJson(json['one_panner']) : null;
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    favourites = json['favourites'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (latestProducts != null) {
      data['latest_products'] =
          latestProducts!.map((v) => v.toJson()).toList();
    }
    if (salariesProducts != null) {
      data['salaries_products'] =
          salariesProducts!.map((v) => v.toJson()).toList();
    }
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    if (cardsAds != null) {
      data['cards_ads'] = cardsAds!.map((v) => v.toJson()).toList();
    }
    if (onePanner != null) {
      data['one_panner'] = onePanner!.toJson();
    }
    if (categories != null) {
      data['Categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['favourites'] = favourites;
    data['card'] = card;
    return data;
  }
}

class LatestProducts {
  int? id;
  String? name;
  dynamic rate;
  int? oldPrice;
  String? cardImage;
  int? rateNum;
  int? discount;
  dynamic priceNew;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rate'] = rate;
    data['old_price'] = oldPrice;
    data['card_image'] = cardImage;
    data['rate_num'] = rateNum;
    data['discount'] = discount;
    data['price_new'] = priceNew;
    data['fav'] = fav;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['desc'] = desc;
    data['image'] = image;
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