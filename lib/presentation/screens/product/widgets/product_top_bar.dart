import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/presentation/screens/auth/controllers/auth_controller.dart';
import 'package:ecommerce/presentation/screens/fav/controller/fav_controller.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/models/product/product.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class ProductTopBar extends StatefulWidget {

  final Product product;
  const ProductTopBar({super.key, required this.product});

  @override
  State<ProductTopBar> createState() => _ProductTopBarState();
}

class _ProductTopBarState extends State<ProductTopBar> {

  late bool added;

  @override
  void initState() {
    super.initState();
    setState(() {
      added = Get.find<FavController>().isInFav(widget.product.id ?? -1);
    });
    debugPrint('--------- a $added');
  }

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
              Get.find<AuthController>().isUserLoggedIn() ?
                Get.find<FavController>().addFav(LatestProducts(
                    id: widget.product.id,
                    name: widget.product.name,
                    rate: widget.product.rate,
                    oldPrice: widget.product.oldPrice,
                    cardImage: widget.product.cardImage,
                    rateNum: widget.product.rateNum,
                    discount: widget.product.discount,
                    priceNew: widget.product.priceNew,
                    fav: widget.product.fav
                )).then((isAdded) {
                  setState(() {
                    added = !added;
                  });
                  Get.showSnackbar(
                    GetSnackBar(
                      message: isAdded ? AppStrings.addedFavSnackBar.tr : AppStrings.removeFavSnackBar.tr,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }) : showRequireAuthDialog(context);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.white,
                border: Border.all(
                    color: added ? ColorManager.red : ColorManager.grey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.favorite_border,
                  color: added ? ColorManager.red : ColorManager.grey,
                ),
              ),
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
