import 'dart:math';

import 'package:ecommerce/data/remote/remote_data_source.dart';
import 'package:ecommerce/domain/models/cart/cart.dart';
import 'package:ecommerce/domain/models/order.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:ecommerce/domain/models/profile.dart';
import 'package:ecommerce/domain/repository/repository.dart';
import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../domain/models/category_product.dart';
import '../../domain/models/home/home_data.dart';
import '../../domain/models/order_details.dart';
import '../local/local_data_source.dart';

class RepositoryImpl implements Repository {

  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(this._remoteDataSource, this._localDataSource);

  // Local Data Source

  @override
  Future<void> addToCartLocal(String productId) async {
    return await _localDataSource.addToCart(productId);
  }

  @override
  String getLang() {
    return _localDataSource.getLang();
  }

  @override
  List<String> getLocalProducts() {
    return _localDataSource.getLocalProducts();
  }

  @override
  String getStoreType() {
    return _localDataSource.getStoreType();
  }

  @override
  bool isInCart(String productId) {
    return _localDataSource.isInCart(productId);
  }

  @override
  bool isUserLoggedIn() {
    return _localDataSource.isUserLoggedIn();
  }

  @override
  Future<void> logout() async {
    return await _localDataSource.logout();
  }

  @override
  Future<void> removeAllFromCart() async {
    return await _localDataSource.removeAllFromCart();
  }

  @override
  Future<void> removeFromCartLocal(String productId) async {
    return await _localDataSource.removeFromCart(productId);
  }

  @override
  Future<void> setKind(String kind) async {
    return await _localDataSource.setKind(kind);
  }

  @override
  Future<void> setLanguage(String language) async {
    return await _localDataSource.setLanguage(language);
  }

  @override
  Future<void> setStoreType(String storeType) async {
    if (storeType == '2') {
      ColorManager.primary = const Color(0xFFD32026);
    } else {
      ColorManager.primary = const Color(0xFF0A458B);
    }
    return await _localDataSource.setStoreType(storeType);
  }

  @override
  Future<void> setToken(String token) async {
    return await _localDataSource.setToken(token);
  }

  @override
  Future<void> setUserLoggedIn() async {
    return await _localDataSource.setUserLoggedIn();
  }

  @override
  Future<void> setUserLoginType(String type) async {
    return await _localDataSource.setUserLoginType(type);
  }

  // Authentication

  @override
  Future<void> loginWithFacebook() async {
    await _remoteDataSource.loginWithFacebook().then((value) {
      _localDataSource.setUserLoginType('facebook');
      _localDataSource.setUserLoggedIn();
    });
  }

  @override
  Future<void> loginWithGoogle() async {
    await _remoteDataSource.loginWithGoogle().then((value) {
      _localDataSource.setUserLoginType('google');
      _localDataSource.setUserLoggedIn();
    });
  }

  @override
  Future<void> login(String phoneNumber, String password) async {
    await _remoteDataSource.login(phoneNumber, password, _localDataSource.getKind());
  }

  @override
  Future<void> confirmPhoneNumber(String phoneNumber) async {
    await _remoteDataSource.confirmPhoneNumber(phoneNumber, _localDataSource.getKind());
  }

  @override
  Future<void> enterCode(String phoneNumber, String code) async {
    await _remoteDataSource.enterCode(phoneNumber,code, _localDataSource.getKind());
  }

  @override
  Future<void> register(String phoneNumber, String name, String email, String password, String conPassword) async {
    await _remoteDataSource.register(phoneNumber, name, _localDataSource.getKind(), email, password, conPassword);
  }

  @override
  Future<void> sendNumber(String phoneNumber) {
    return _remoteDataSource.sendNumber(phoneNumber);
  }

  @override
  Future<void> resetPassword(String phoneNumber, String code, String password) {
    return _remoteDataSource.resetPassword(phoneNumber, code, password);
  }

  // Remote Data Source

  @override
  Future<HomeData> getHomeData() async {
    return await _remoteDataSource.getHomeData(_localDataSource.getStoreType(), _localDataSource.getLang());
  }

  @override
  Future<String> getAboutUs() async {
    return await _remoteDataSource.getAboutUs();
  }

  @override
  Future<Product> getProductDetails(String id) async {
    return await _remoteDataSource.getProductDetails(id, _localDataSource.getStoreType());
  }

  @override
  Future<List<LatestProducts>> getLatestProducts() async {
    return await _remoteDataSource.getLatestProducts(_localDataSource.getStoreType());
  }

  @override
  Future<List<LatestProducts>> getBestSellerProducts() async {
    return await _remoteDataSource.getBestSellerProducts(_localDataSource.getStoreType());
  }

  @override
  Future<List<LatestProducts>> search(String searchString) async {
    return await _remoteDataSource.search(searchString);
  }

  @override
  Future<List<LatestProducts>> filter(List<String> rate, String minPrice, String maxPrice, List<String> sections) {
    return _remoteDataSource.filter(rate, minPrice, maxPrice, sections, _localDataSource.getStoreType());
  }

  @override
  Future<List<CategoryProduct>> getCategoryProducts(String categoryId) {
    return _remoteDataSource.getCategoryProducts(categoryId, _localDataSource.getStoreType());
  }

  @override
  Future<bool> addFav(String productId) {
    return _remoteDataSource.addFav(_localDataSource.getToken(), productId, _localDataSource.getKind());
  }

  @override
  Future<List<LatestProducts>> getFav() {
    if (_localDataSource.isUserLoggedIn()) {
      return _remoteDataSource.getFav(_localDataSource.getToken(), _localDataSource.getKind());
    } else {
      return Future(() => []);
    }
  }

  @override
  Future<List<Carts>> getCart() {
    if (_localDataSource.getToken() == '') {
      _localDataSource.setToken(Random().nextInt(16).toString());
    }
    return _remoteDataSource.getCart(_localDataSource.getToken(), _localDataSource.getKind());
  }

  @override
  Future<void> addToCart(String productId, String count) {
    if (_localDataSource.getToken() == '') {
      _localDataSource.setToken(Random().nextInt(16).toString());
    }
    return _remoteDataSource.addToCart(_localDataSource.getToken(), _localDataSource.getKind(), productId, count);
  }

  @override
  Future<Profile> getProfile() {
    if (_localDataSource.isUserLoggedIn()) {
      return _remoteDataSource.getProfile(_localDataSource.getToken(), _localDataSource.getKind());
    } else {
      return Future(() => Profile());
    }
  }

  @override
  Future<void> removeFromCart(String cartId) {
    return _remoteDataSource.removeFromCart(cartId);
  }

  @override
  Future<List<Order>> getOrders() {
    return _remoteDataSource.getOrders(_localDataSource.getToken(), _localDataSource.getKind());
  }

  @override
  Future<void> finishOrder(String firstName, String lastName, String phone, String address, String payType) async {
    if (_localDataSource.isUserLoggedIn()) {
      await _remoteDataSource.finishOrder(_localDataSource.getToken(), _localDataSource.getKind(), firstName, lastName, phone, address, payType);
    } else {
      await _remoteDataSource.finishOrderUnAuth('$firstName $lastName', phone, address);
    }
  }

  @override
  Future<OrderDetails> getOrderDetails(String orderId) {
    return _remoteDataSource.getOrderDetails(_localDataSource.getToken(), _localDataSource.getKind(), orderId);
  }

  @override
  Future<List<Carts>> getProductsFromId(String ids) {
    return _remoteDataSource.getProductsFromId(ids);
  }

  @override
  Future<void> addToFavLocal(String productId) {
    return _localDataSource.addToFav(productId);
  }

  @override
  List<String> getLocalFavProductsLocal() {
    return _localDataSource.getLocalFavProducts();
  }

  @override
  bool isInFavLocal(String productId) {
    return _localDataSource.isInFav(productId);
  }

  @override
  Future<void> removeAllFromFavLocal() {
    return _localDataSource.removeAllFromFav();
  }

  @override
  Future<void> removeFromFavLocal(String productId) {
    return _localDataSource.removeFromFav(productId);
  }
}