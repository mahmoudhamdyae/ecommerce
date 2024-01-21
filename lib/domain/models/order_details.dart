class OrderDetails {
  int? status;
  String? message;
  Data? data;

  OrderDetails({this.status, this.message, this.data});

  OrderDetails.fromJson(Map<String, dynamic> json) {
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
  int? orderTotal;
  int? discount;
  double? grandTotal;
  String? orderPay;
  int? dilivary;
  String? status;
  String? statusCode;
  List<Carts2>? carts;
  int? favourites;
  int? card;

  Data(
      {this.orderId,
        this.orderTotal,
        this.discount,
        this.grandTotal,
        this.orderPay,
        this.dilivary,
        this.status,
        this.statusCode,
        this.carts,
        this.favourites,
        this.card});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderTotal = json['order_total'];
    discount = json['Discount'];
    grandTotal = json['grand_total'];
    orderPay = json['order_pay'];
    dilivary = json['dilivary'];
    status = json['status'];
    statusCode = json['status_code'];
    if (json['Carts'] != null) {
      carts = <Carts2>[];
      json['Carts'].forEach((v) {
        carts!.add(Carts2.fromJson(v));
      });
    }
    favourites = json['favourites'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_total'] = orderTotal;
    data['Discount'] = discount;
    data['grand_total'] = grandTotal;
    data['order_pay'] = orderPay;
    data['dilivary'] = dilivary;
    data['status'] = status;
    data['status_code'] = statusCode;
    if (carts != null) {
      data['Carts'] = carts!.map((v) => v.toJson()).toList();
    }
    data['favourites'] = favourites;
    data['card'] = card;
    return data;
  }
}

class Carts2 {
  String? name;
  int? id;
  String? image;
  int? rate;
  int? price;
  int? priceOld;
  int? count;

  Carts2(
      {this.name,
        this.id,
        this.image,
        this.rate,
        this.price,
        this.priceOld,
        this.count});

  Carts2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['Image'];
    rate = json['rate'];
    price = json['price'];
    priceOld = json['price_old'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['Image'] = image;
    data['rate'] = rate;
    data['price'] = price;
    data['price_old'] = priceOld;
    data['count'] = count;
    return data;
  }
}