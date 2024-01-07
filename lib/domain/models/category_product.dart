class CategoryProduct {
  int? id;
  String? nameAr;
  String? nameEn;
  String? desAr;
  String? desEn;
  int? price;
  dynamic priceDiscount;
  dynamic dealerPrice;
  int? stock;
  int? payCount;
  dynamic rate;
  String? createdAt;
  String? updatedAt;
  String? cardImage;
  List<int>? categoriesIds;
  List<Images>? images;
  List<Categories>? categories;

  CategoryProduct(
      {this.id,
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
        this.images,
        this.categories});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['des_ar'] = desAr;
    data['des_en'] = desEn;
    data['price'] = price;
    data['price_discount'] = priceDiscount;
    data['dealer_price'] = dealerPrice;
    data['stock'] = stock;
    data['pay_count'] = payCount;
    data['rate'] = rate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['card_image'] = cardImage;
    data['categories_ids'] = categoriesIds;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Images({this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}