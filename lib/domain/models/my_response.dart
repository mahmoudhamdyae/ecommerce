class MyResponse {
  int? status;
  List<Datas>? datas;

  MyResponse({this.status, this.datas});

  MyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['datas'] != null) {
      datas = <Datas>[];
      json['datas'].forEach((v) {
        datas!.add(new Datas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.datas != null) {
      data['datas'] = this.datas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datas {
  int? id;
  String? image;
  String? nameAr;
  String? nameEn;
  String? desAr;
  String? desEn;
  int? price;
  double? priceDiscount;
  double? dealerPrice;
  int? stock;
  int? payCount;
  int? rate;
  String? createdAt;
  String? updatedAt;
  String? cardImage;
  List<int>? categoriesIds;
  List<Categories>? categories;

  Datas(
      {this.id,
        this.image,
        this.nameAr,
        this.nameEn,
        this.desAr,
        this.desEn,
        this.price,
        this.priceDiscount,
        this.dealerPrice,
        this.stock,
        this.payCount,
        this.rate,
        this.createdAt,
        this.updatedAt,
        this.cardImage,
        this.categoriesIds,
        this.categories});

  Datas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    desAr = json['des_ar'];
    desEn = json['des_en'];
    price = json['price'];
    priceDiscount = json['price_discount'];
    dealerPrice = json['dealer_price'];
    stock = json['stock'];
    payCount = json['pay_count'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cardImage = json['card_image'];
    categoriesIds = json['categories_ids'].cast<int>();
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['des_ar'] = this.desAr;
    data['des_en'] = this.desEn;
    data['price'] = this.price;
    data['price_discount'] = this.priceDiscount;
    data['dealer_price'] = this.dealerPrice;
    data['stock'] = this.stock;
    data['pay_count'] = this.payCount;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['card_image'] = this.cardImage;
    data['categories_ids'] = this.categoriesIds;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  int? productId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.productId,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}