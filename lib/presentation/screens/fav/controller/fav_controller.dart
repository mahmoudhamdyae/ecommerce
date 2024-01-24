import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavController extends GetxController {

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final RxList<LatestProducts> fav = RxList.empty();

  final Repository _repository;

  FavController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getFav();
  }

  _getFav() async {
    _status.value = RxStatus.loading();
    try {
      if (_repository.isUserLoggedIn()) {
        _repository.getFav().then((remoteFav) {
          _status.value = RxStatus.success();
          fav.value = remoteFav;
        });
      } else {
      //   List<String> productsIds = _repository.getLocalFavProductsLocal();
      //   if (productsIds.isEmpty) {
      //     _status.value = RxStatus.success();
      //     fav.value = [];
      //   } else {
      //     String ids = '';
      //     int count = 0;
      //     for (var element in productsIds) {
      //       if (count == 0) {
      //         ids += '?id[]=$element';
      //       } else {
      //         ids += '&id[]=$element';
      //       }
      //       count++;
      //     }
      //     _repository.getProductsFromId(ids).then((myResponse) {
      //       fav.value = myResponse.map((e) => LatestProducts(
      //         name: e.name,
      //         id: e.id,
      //         cardImage: e.image,
      //         oldPrice: e.priceOld,
      //         priceNew: e.price,
      //         discount: e.priceOld,
      //         rate: e.rate,
      //         rateNum: e.rate,
      //       )).toList();
      //       _status.value = RxStatus.success();
      //     });
      //   }
      }
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  Future<bool> addFav(LatestProducts product) async {
    bool isAdded = false;
    _status.value = RxStatus.loading();
    try {
      if (_repository.isUserLoggedIn()) {
        await _repository.addFav(product.id.toString()).then((value) {
          _status.value = RxStatus.success();
          isAdded = value;
          if (isAdded) {
            fav.add(product);
          } else {
            fav.remove(product);
          }
        });
      } else {
        // isAdded = _repository.isInFavLocal(product.id.toString());
        // debugPrint('---------------- aaaa $isAdded');
        // if (isAdded) {
        //   await _repository.removeFromFavLocal(product.id.toString()).then((value) {
        //     _status.value = RxStatus.success();
        //     isAdded = false;
        //     debugPrint('---------------- aaaa2 $isAdded');
        //   });
        //   fav.add(product);
        // } else {
        //   await _repository.addToFavLocal(product.id.toString()).then((value) {
        //     _status.value = RxStatus.success();
        //     isAdded = true;
        //     debugPrint('---------------- aaaa21 $isAdded');
        //   });
        //   fav.remove(product);
        // }
      }
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
    return isAdded;
  }

  bool isInFav(int favId) {
    if (_repository.isUserLoggedIn()) {
      return _repository.isInFavLocal(favId.toString());
    } else {
      bool inFav = false;
      for (LatestProducts favItem in fav) {
        if (favItem.id == favId) {
          inFav = true;
          break;
        }
      }
      return inFav;
    }
  }
}