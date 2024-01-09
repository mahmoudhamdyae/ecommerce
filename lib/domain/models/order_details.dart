class OrderDetails {
  String? test;

  OrderDetails({this.test});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    test = json['test'];
  }
}