import 'package:ecommerce/presentation/screens/orders/controller/order_controller.dart';
import 'package:ecommerce/presentation/screens/orders/widgets/orders_empty_screen.dart';
import 'package:ecommerce/presentation/screens/orders/widgets/orders_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/shimmer/grid_shimmer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorManager.white,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: AppPadding.p50,
              bottom: AppPadding.smallPadding,
              right: AppPadding.smallPadding,
              left: AppPadding.smallPadding,
            ),
            child: Text(
              AppStrings.myOrders.tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeightManager.medium,
              ),
            ),
          ),
          Expanded(
            child: GetX<OrderController>(
              init: Get.find<OrderController>(),
              builder: (OrderController controller) {
                return controller.status.isLoading ? const GridShimmer()
                    :
                (controller.orders.isEmpty ? const OrdersEmptyScreen()
                    :
                OrdersScreenBody(orders: controller.orders));
              },
            ),
          ),
        ],
      ),
    );
  }
}
