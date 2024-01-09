import 'package:ecommerce/presentation/resources/values_manager.dart';
import 'package:ecommerce/presentation/screens/orderdetails/widgets/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/order.dart';

class OrdersScreenBody extends StatelessWidget {

  final List<Order> orders;
  const OrdersScreenBody({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.smallPadding),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          Order order = orders[index];
          return InkWell(
            onTap: () {
              Get.to(() => const OrderDetailsScreen(orderId: '',));
            },
            child: Card(
              child: ListTile(
                leading: Image.network(order.image ?? ''),
                title: Text(order.status ?? ''),
                subtitle: Text(order.status ?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}
