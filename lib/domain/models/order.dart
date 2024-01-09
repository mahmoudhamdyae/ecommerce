class OrderResponse {
  int? status;
  String? message;
  Data? data;

  OrderResponse({this.status, this.message, this.data});

  OrderResponse.fromJson(Map<String, dynamic> json) {
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
  List<Order>? orders;
  int? favourites;
  int? card;

  Data({this.orders, this.favourites, this.card});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
    favourites = json['favourites'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    data['favourites'] = favourites;
    data['card'] = card;
    return data;
  }
}

class Order {
  String? status;
  int? orderNum;
  String? date;
  String? image;

  Order({this.status, this.orderNum, this.date, this.image});

  Order.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderNum = json['order_num'];
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['order_num'] = orderNum;
    data['date'] = date;
    data['image'] = image;
    return data;
  }
}