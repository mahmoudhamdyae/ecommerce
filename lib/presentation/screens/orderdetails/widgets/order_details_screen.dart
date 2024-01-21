import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/models/order_details.dart';
import 'package:ecommerce/presentation/screens/categories/widgets/products_grid_view.dart';
import 'package:ecommerce/presentation/screens/home/widgets/product_item.dart';
import 'package:ecommerce/presentation/screens/orders/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {

  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<OrderController>(
        init: Get.find<OrderController>(),
        builder: (OrderController controller) {
          OrderDetails orderDetails = controller.orderDetails.value;
          return Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: ProductsGridView(products: orderDetails.data!.carts!.map((e) => LatestProducts(
              id: e.id,
              priceNew: e.price,
              oldPrice: e.priceOld,
              cardImage: e.image,
              name: e.name
            )).toList()),
          );
        },
      ),
    );
  }
}
