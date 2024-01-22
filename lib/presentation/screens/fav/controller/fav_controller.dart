import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/repository/repository.dart';
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
      _repository.getFav().then((remoteFav) {
        _status.value = RxStatus.success();
        fav.value = remoteFav;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  Future<bool> addFav(LatestProducts product) async {
    bool isAdded = false;
    _status.value = RxStatus.loading();
    try {
      await _repository.addFav(product.id.toString()).then((value) {
        _status.value = RxStatus.success();
        isAdded = value;
        if (isAdded) {
          fav.add(product);
        } else {
          fav.remove(product);
        }
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
    return isAdded;
  }

  bool isInFav(int favId) {
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