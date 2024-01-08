import 'package:ecommerce/domain/models/order_by.dart';
import 'package:get/get.dart';

import '../../../../domain/models/category_product.dart';
import '../../../../domain/repository/repository.dart';

class CategoriesController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<CategoryProduct> latestProducts = RxList.empty();
  final RxList<CategoryProduct> searchedProducts = RxList.empty();
  final RxBool isSearching = false.obs;

  final Repository _repository;

  CategoriesController(this._repository);

  void getCategoriesProducts(String categoryId) {
    error.value = '';
    try {
      _repository.getCategoryProducts(categoryId).then((value) {
        isLoading.value = false;
        error.value = '';
        latestProducts.value = value;
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  void filterProducts(List<String> rate, String minPrice, String maxPrice, List<String> sections) {
    error.value = '';
    try {
      _repository.filter(rate, minPrice, maxPrice, sections).then((value) {
        isLoading.value = false;
        error.value = '';
        latestProducts.value = value.map((e) => CategoryProduct(
            id : e.id,
            nameAr : e.name,
            nameEn : e.name,
            price : e.priceNew,
            priceDiscount : e.oldPrice,
            dealerPrice : e.priceNew,
            rate : e.rate,
            cardImage : e.cardImage,
        )).toList();
      });
    } on Exception catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  void search(String searchString) {
    searchedProducts.value = latestProducts.where((product) =>
            product.nameAr!.contains(searchString) ||
                product.desAr!.contains(searchString)).toList();
  }

  void sortBy(OrderBy orderBy) {
    switch(orderBy) {
      case OrderBy.all:
        break;
      case OrderBy.highest:
        latestProducts.sort((b, a) => a.price!.compareTo(b.price as num));
        break;
      case OrderBy.lowest:
        latestProducts.sort((a, b) => a.price!.compareTo(b.price as num));
        break;
      case OrderBy.recently:
        latestProducts.sort((a, b) => a.createdAt!.compareTo(b.createdAt ?? ''));
        break;
    }
  }
}