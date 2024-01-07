import 'dart:convert';

import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/data/network_info.dart';
import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;

import '../../core/app_prefs.dart';
import '../../presentation/resources/strings_manager.dart';

abstract class RemoteDataSource {
  Future<void> login(String phoneNumber, String password, String kind);
  Future<void> confirmPhoneNumber(String phoneNumber, String kind);
  Future<void> enterCode(String phoneNumber, String code, String kind);
  Future<void> register(String phoneNumber, String name, String kind, String email, String password, String conPassword);

  Future<HomeData> getHomeData(String section, String lang);
  Future<String> getAboutUs();
  Future<Product> getProductDetails(String id, String section);
  Future<List<LatestProducts>> getLatestProducts(String section);
  Future<List<LatestProducts>> getBestSellerProducts(String section);
}

class RemoteDataSourceImpl implements RemoteDataSource {

  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;

  RemoteDataSourceImpl(this._networkInfo, this._appPreferences);

  _checkNetworkAndServer() async {
    if (await _networkInfo.isConnected) {
      await _checkServer();
    } else {
      throw Exception(AppStrings.noInternetError.tr);
    }
  }

  _checkServer() async {
    // try {
    //   final result = await InternetAddress.lookup(AppConstants.baseUrl);
    //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     debugPrint('connected');
    //   }
    // } on SocketException catch (_) {
    //   debugPrint(AppStrings.serverDown.tr);
    //   throw Exception(AppStrings.serverDown);
    // }
  }

  _checkResponse(dynamic responseData) {
    if (responseData['status'] != 200) {
      throw Exception(responseData['message']);
    }
  }

  @override
  Future<void> login(String phoneNumber, String password, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}login?password=$password&phone=$phoneNumber&kind=$kind";
    final response = await http.post(Uri.parse(url));

    var responseData = json.decode(response.body);
    debugPrint('Login Response: $responseData');
    _checkResponse(responseData);
    _appPreferences.setToken(responseData['data']['api_token']);
    debugPrint('Register Response api token: ${responseData['data']['api_token']}');
  }

  @override
  Future<void> confirmPhoneNumber(String phoneNumber, String kind) async {
    await _checkNetworkAndServer();
    try {
      // Initialize Ip Address
      // var ipAddress = IpAddress(type: RequestType.json);
      //
      // // Get the IpAddress based on requestType.
      // dynamic data = await ipAddress.getIpAddress();
      // debugPrint(data.toString());

      // Confirm Phone Number
      String url = "${AppConstants.baseUrl}register-Verify-Send-Code?active_phone=$phoneNumber&phone=$phoneNumber&kind=$kind";
      final response = await http.post(Uri.parse(url));

      var responseData = json.decode(response.body);
      debugPrint('Confirm Response: $responseData');
      _checkResponse(responseData);
    } on IpAddressException catch (exception) {
      debugPrint(exception.message);
    }
  }

  @override
  Future<void> enterCode(String phoneNumber, String code, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}register-Verify-enter-Code?code=$code&phone=$phoneNumber&kind=$kind";
    final response = await http.post(Uri.parse(url));

    var responseData = json.decode(response.body);
    debugPrint('Enter Code Response: $responseData');
    _checkResponse(responseData);
  }

  @override
  Future<void> register(String phoneNumber, String name, String kind, String email, String password, String conPassword) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}register-info?kind=$kind&phone=$phoneNumber&name=$name&email=$email&password=$password&con_password=$conPassword";
    final response = await http.post(Uri.parse(url));

    var responseData = json.decode(response.body);
    debugPrint('Register Response: $responseData');
    _checkResponse(responseData);
    _appPreferences.setToken(responseData['data']['api_token']);
    debugPrint('Register Response api token: ${responseData['data']['api_token']}');
  }

  @override
  Future<HomeData> getHomeData(String section, String lang) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}home";
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'section': section,
          'lang': lang,
        }
    );

    debugPrint('Get Home Data Response: ${response.body}');
    var responseData = json.decode(response.body);
    debugPrint('Get Home Data Response: $responseData');
    HomeData homeData = HomeData.fromJson(responseData);
    debugPrint('Get Home Data Response Home Data: $homeData');
    _checkResponse(responseData);
    return homeData;
  }

  // Settings

  @override
  Future<String> getAboutUs() async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}about-us";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Who Are We Response: ${responseData['data']['about']}');
    return responseData['data']['about'];
  }

  @override
  Future<Product> getProductDetails(String id, String section) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}detials-product";
    final response = await http.get(
        Uri.parse(url).replace(queryParameters: {
          'id' : id,
        }),
        headers: {
          'section': section,
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Product Details Response: $responseData');
    Product product = ProductResponse.fromJson(responseData).data ?? Product();
    return product;
  }

  @override
  Future<List<LatestProducts>> getLatestProducts(String section) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}latest-products";
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'section': section,
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Get Latest Products Response: $responseData');
    List<LatestProducts> products = [];
    for (var singleProduct in responseData['data']['latest_products']) {
      products.add(LatestProducts.fromJson(singleProduct));
    }
    return products;
  }

  @override
  Future<List<LatestProducts>> getBestSellerProducts(String section) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}best-seller";
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'section': section,
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Get Best Seller Products Response: $responseData');
    List<LatestProducts> products = [];
    for (var singleProduct in responseData['data']['latest_products']) {
      products.add(LatestProducts.fromJson(singleProduct));
    }
    return products;
  }

}