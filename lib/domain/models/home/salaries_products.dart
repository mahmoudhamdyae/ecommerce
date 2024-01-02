class SalariesProducts {
  List<SalariesProducts>? salariesProducts;

  SalariesProducts({this.salariesProducts});

  SalariesProducts.fromJson(Map<String, dynamic> json) {
    if (json['salaries_products'] != null) {
      salariesProducts = <SalariesProducts>[];
      json['salaries_products'].forEach((v) {
        salariesProducts!.add(SalariesProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (salariesProducts != null) {
      data['salaries_products'] =
          salariesProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}