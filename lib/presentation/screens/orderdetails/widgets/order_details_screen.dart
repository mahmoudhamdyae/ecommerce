import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/models/order_details.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/font_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/categories/widgets/products_grid_view.dart';
import 'package:ecommerce/presentation/screens/orders/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {

  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorManager.lightGrey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0, right: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  AppStrings.orderDetails.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: FontSize.s20,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
            GetX<OrderController>(
              init: Get.find<OrderController>(),
              builder: (OrderController controller) {
                OrderDetails orderDetails = controller.orderDetails.value;
                return Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: ProductsGridView(products: orderDetails.data?.carts?.map((e) => LatestProducts(
                    id: e.id,
                    priceNew: e.price,
                    oldPrice: e.priceOld,
                    cardImage: e.image,
                    name: e.name
                  )).toList() ?? []),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
