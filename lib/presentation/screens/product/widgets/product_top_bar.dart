import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/presentation/screens/fav/controller/fav_controller.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../data/local/local_data_source.dart';
import '../../../../di/di.dart';
import '../../../../domain/models/product/product.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class ProductTopBar extends StatelessWidget {

  final LocalDataSource _appPreferences = instance<LocalDataSource>();
  final Product product;
  ProductTopBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          // تفاصيل المنتج
          Text(
            AppStrings.productDetails.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeightManager.medium,
            ),
          ),
          Expanded(child: Container()),
          // Fav Button
          InkWell(
            onTap: () {
              if (_appPreferences.isUserLoggedIn()) {
                Get.find<FavController>().addFav(LatestProducts(
                    id: product.id,
                    name: product.name,
                    rate: product.rate,
                    oldPrice: product.oldPrice,
                    cardImage: product.cardImage,
                    rateNum: product.rateNum,
                    discount: product.discount,
                    priceNew: product.priceNew,
                    fav: product.fav
                )).then((isAdded) {
                  Get.showSnackbar(
                    GetSnackBar(
                      message: isAdded ? AppStrings.addedFavSnackBar.tr : AppStrings.removeFavSnackBar.tr,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                });
              } else {
                showRequireAuthDialog(context);
              }
            },
            child: GetX<FavController>(
              init: Get.find<FavController>(),
              builder: (FavController controller) {
                return Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.white,
                      border: Border.all(
                          color: controller.isInFav(product.id ?? -1) ? ColorManager.red : ColorManager.grey
                      ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: controller.isInFav(product.id ?? -1) ? ColorManager.red : ColorManager.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            width: AppSize.s8,
          ),
          // Share Button
          InkWell(
            onTap: () {
              debugPrint('Share Button Clicked');
              Share.share('check out my website https://example.com');
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.white,
                  border: Border.all(color: ColorManager.grey)),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.share,
                  color: ColorManager.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s8,
          ),
        ],
      ),
    );
  }
}
