import 'package:ecommerce/domain/models/order_details.dart';
import 'package:ecommerce/presentation/screens/orders/controller/order_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {

  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    Get.find<OrderController>().getOrderDetails(orderId);
    return GetX<OrderController>(
      init: Get.find<OrderController>(),
      builder: (OrderController controller) {
        OrderDetails orderDetails = controller.orderDetails.value;
        return Text(orderDetails.test  ?? '');
      },
    );
  }
}
