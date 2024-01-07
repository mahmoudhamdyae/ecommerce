import 'package:ecommerce/data/remote/remote_data_source.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:ecommerce/domain/repository/repository.dart';

import '../../domain/models/category_product.dart';
import '../../domain/models/home/home_data.dart';

class RepositoryImpl implements Repository {

  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<void> login(String phoneNumber, String password, String kind) async {
    await _remoteDataSource.login(phoneNumber, password, kind);
  }

  @override
  Future<void> confirmPhoneNumber(String phoneNumber, String kind) async {
    await _remoteDataSource.confirmPhoneNumber(phoneNumber, kind);
  }

  @override
  Future<void> enterCode(String phoneNumber, String code, String kind) async {
    await _remoteDataSource.enterCode(phoneNumber,code, kind);
  }

  @override
  Future<void> register(String phoneNumber, String name, String kind, String email, String password, String conPassword) async {
    await _remoteDataSource.register(phoneNumber, name, kind, email, password, conPassword);
  }

  @override
  Future<HomeData> getHomeData(String section, String lang) async {
    return await _remoteDataSource.getHomeData(section, lang);
  }

  @override
  Future<String> getAboutUs() async {
    return await _remoteDataSource.getAboutUs();
  }

  @override
  Future<Product> getProductDetails(String id, String section) async {
    return await _remoteDataSource.getProductDetails(id, section);
  }

  @override
  Future<List<LatestProducts>> getLatestProducts(String section) async {
    return await _remoteDataSource.getLatestProducts(section);
  }

  @override
  Future<List<LatestProducts>> getBestSellerProducts(String section) async {
    return await _remoteDataSource.getBestSellerProducts(section);
  }

  @override
  Future<List<LatestProducts>> search(String searchString) async {
    return await _remoteDataSource.search(searchString);
  }

  @override
  Future<List<LatestProducts>> filter(List<String> rate, String minPrice, String maxPrice, List<String> sections, String section) {
    return _remoteDataSource.filter(rate, minPrice, maxPrice, sections, section);
  }

  @override
  Future<List<CategoryProduct>> getCategoryProducts(String categoryId, String section) {
    return _remoteDataSource.getCategoryProducts(categoryId, section);
  }

  @override
  Future<List<LatestProducts>> getFav(String userToken) {
    return _remoteDataSource.getFav(userToken);
  }

  @override
  Future<List<LatestProducts>> getCart(String userToken) {
    return _remoteDataSource.getCart(userToken);
  }
}