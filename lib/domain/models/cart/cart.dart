class Cart {
  int? status;
  String? message;
  Data? data;

  Cart({this.status, this.message, this.data});

  Cart.fromJson(Map<String, dynamic> json) {
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
  int? orderId;
  dynamic orderTotal;
  int? dilivary;
  int? discount;
  dynamic grandTotal;
  List<Carts>? carts;

  Data(
      {this.orderId,
        this.orderTotal,
        this.dilivary,
        this.discount,
        this.grandTotal,
        this.carts});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderTotal = json['order_total'];
    dilivary = json['dilivary'];
    discount = json['Discount'];
    grandTotal = json['grand_total'];
    if (json['Carts'] != null) {
      carts = <Carts>[];
      json['Carts'].forEach((v) {
        carts!.add(Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_total'] = orderTotal;
    data['dilivary'] = dilivary;
    data['Discount'] = discount;
    data['grand_total'] = grandTotal;
    if (carts != null) {
      data['Carts'] = carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  String? name;
  int? cartId;
  int? id;
  String? image;
  int? rate;
  dynamic price;
  int? priceOld;
  int? count;

  Carts(
      {this.name,
        this.cartId,
        this.id,
        this.image,
        this.rate,
        this.price,
        this.priceOld,
        this.count});

  Carts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cartId = json['cart_id'];
    id = json['id'];
    image = json['Image'];
    rate = json['rate'];
    price = json['price'];
    priceOld = json['price_old'];
    count = json['count'];
  }

  Carts.fromJson2(Map<String, dynamic> json) {
    name = json['name'];
    cartId = json['id'];
    id = json['id'];
    image = json['card_image'];
    rate = json['rate'];
    price = json['price_new'];
    priceOld = json['old_price'];
    count = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cart_id'] = cartId;
    data['id'] = id;
    data['Image'] = image;
    data['rate'] = rate;
    data['price'] = price;
    data['price_old'] = priceOld;
    data['count'] = count;
    return data;
  }
}