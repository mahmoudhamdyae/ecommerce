import 'package:ecommerce/domain/models/order_details.dart';
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
          return Text(orderDetails.message.toString()  ?? '');
        },
      ),
    );
  }
}
