class ProductResponse {
  int? status;
  String? message;
  Product? data;

  ProductResponse({this.status, this.message, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Product.fromJson(json['data']) : null;
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

class Product {
  int? id;
  String? name;
  int? rate;
  String? desc;
  int? oldPrice;
  String? cardImage;
  int? rateNum;
  int? discount;
  int? priceNew;
  int? stock;
  bool? fav;
  List<CopiesProducts>? copiesProducts;
  List<Images>? images;
  List<ProTypes>? proTypes;
  List<dynamic>? proComments;
  String? favourites;
  String? card;

  Product(
      {this.id,
        this.name,
        this.rate,
        this.desc,
        this.oldPrice,
        this.cardImage,
        this.rateNum,
        this.discount,
        this.priceNew,
        this.stock,
        this.fav,
        this.copiesProducts,
        this.images,
        this.proTypes,
        this.proComments,
        this.favourites,
        this.card});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
    desc = json['desc'];
    oldPrice = json['old_price'];
    cardImage = json['card_image'];
    rateNum = json['rate_num'];
    discount = json['discount'];
    priceNew = json['price_new'];
    stock = json['stock'];
    fav = json['fav'];
    if (json['copies_products'] != null) {
      copiesProducts = <CopiesProducts>[];
      json['copies_products'].forEach((v) {
        copiesProducts!.add(CopiesProducts.fromJson(v));
      });
    }
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['ProTypes'] != null) {
      proTypes = <ProTypes>[];
      json['ProTypes'].forEach((v) {
        proTypes!.add(ProTypes.fromJson(v));
      });
    }
    if (json['ProComments'] != null) {
      proComments = <dynamic>[];
      json['ProComments'].forEach((v) {
        proComments!.add(v);
      });
    }
    favourites = json['favourites'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rate'] = rate;
    data['desc'] = desc;
    data['old_price'] = oldPrice;
    data['card_image'] = cardImage;
    data['rate_num'] = rateNum;
    data['discount'] = discount;
    data['price_new'] = priceNew;
    data['stock'] = stock;
    data['fav'] = fav;
    if (copiesProducts != null) {
      data['copies_products'] =
          copiesProducts!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['Images'] = images!.map((v) => v.toJson()).toList();
    }
    if (proTypes != null) {
      data['ProTypes'] = proTypes!.map((v) => v.toJson()).toList();
    }
    if (proComments != null) {
      data['ProComments'] = proComments!.map((v) => v.toJson()).toList();
    }
    data['favourites'] = favourites;
    data['card'] = card;
    return data;
  }
}

class CopiesProducts {
  int? id;
  String? image;
  String? name;
  int? rate;
  int? oldPrice;
  String? cardImage;
  int? rateNum;
  int? discount;
  int? priceNew;
  bool? fav;

  CopiesProducts(
      {this.id,
        this.image,
        this.name,
        this.rate,
        this.oldPrice,
        this.cardImage,
        this.rateNum,
        this.discount,
        this.priceNew,
        this.fav});

  CopiesProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
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
    data['image'] = image;
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

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Image'] = image;
    return data;
  }
}

class ProTypes {
  int? id;
  String? value;
  String? name;

  ProTypes({this.id, this.value, this.name});

  ProTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['name'] = name;
    return data;
  }
}