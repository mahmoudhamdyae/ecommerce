import 'package:ecommerce/data/remote/remote_data_source.dart';
import 'package:ecommerce/domain/models/cart/cart.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:ecommerce/domain/models/profile.dart';
import 'package:ecommerce/domain/repository/repository.dart';

import '../../domain/models/category_product.dart';
import '../../domain/models/home/home_data.dart';
import '../local/app_prefs.dart';

class RepositoryImpl implements Repository {

  final RemoteDataSource _remoteDataSource;
  final AppPreferences _appPreferences;

  RepositoryImpl(this._remoteDataSource, this._appPreferences);

  @override
  Future<void> login(String phoneNumber, String password) async {
    await _remoteDataSource.login(phoneNumber, password, _appPreferences.getKind());
  }

  @override
  Future<void> confirmPhoneNumber(String phoneNumber) async {
    await _remoteDataSource.confirmPhoneNumber(phoneNumber, _appPreferences.getKind());
  }

  @override
  Future<void> enterCode(String phoneNumber, String code) async {
    await _remoteDataSource.enterCode(phoneNumber,code, _appPreferences.getKind());
  }

  @override
  Future<void> register(String phoneNumber, String name, String email, String password, String conPassword) async {
    await _remoteDataSource.register(phoneNumber, name, _appPreferences.getKind(), email, password, conPassword);
  }

  @override
  Future<HomeData> getHomeData() async {
    return await _remoteDataSource.getHomeData(_appPreferences.getStoreType(), _appPreferences.getLang());
  }

  @override
  Future<String> getAboutUs() async {
    return await _remoteDataSource.getAboutUs();
  }

  @override
  Future<Product> getProductDetails(String id) async {
    return await _remoteDataSource.getProductDetails(id, _appPreferences.getStoreType());
  }

  @override
  Future<List<LatestProducts>> getLatestProducts() async {
    return await _remoteDataSource.getLatestProducts(_appPreferences.getStoreType());
  }

  @override
  Future<List<LatestProducts>> getBestSellerProducts() async {
    return await _remoteDataSource.getBestSellerProducts(_appPreferences.getStoreType());
  }

  @override
  Future<List<LatestProducts>> search(String searchString) async {
    return await _remoteDataSource.search(searchString);
  }

  @override
  Future<List<LatestProducts>> filter(List<String> rate, String minPrice, String maxPrice, List<String> sections) {
    return _remoteDataSource.filter(rate, minPrice, maxPrice, sections, _appPreferences.getStoreType());
  }

  @override
  Future<List<CategoryProduct>> getCategoryProducts(String categoryId) {
    return _remoteDataSource.getCategoryProducts(categoryId, _appPreferences.getStoreType());
  }

  @override
  Future<bool> addFav(String productId) {
    return _remoteDataSource.addFav(_appPreferences.getToken(), productId, _appPreferences.getKind());
  }

  @override
  Future<List<LatestProducts>> getFav() {
    return _remoteDataSource.getFav(_appPreferences.getToken(), _appPreferences.getKind());
  }

  @override
  Future<List<Carts>> getCart() {
    return _remoteDataSource.getCart(_appPreferences.getToken(), _appPreferences.getKind());
  }

  @override
  Future<void> addToCart(String productId, String count) {
    return _remoteDataSource.addToCart(_appPreferences.getToken(), _appPreferences.getKind(), productId, count);
  }

  @override
  Future<Profile> getProfile() {
    return _remoteDataSource.getProfile(_appPreferences.getToken(), _appPreferences.getKind());
  }
}