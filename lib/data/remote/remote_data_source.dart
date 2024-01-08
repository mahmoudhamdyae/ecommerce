import 'dart:convert';

import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/data/network_info.dart';
import 'package:ecommerce/domain/models/cart/cart.dart';
import 'package:ecommerce/domain/models/category_product.dart';
import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;

import '../local/app_prefs.dart';
import '../../domain/models/profile.dart';

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
  Future<List<LatestProducts>> search(String searchString);
  Future<List<LatestProducts>> filter(List<String> rate, String minPrice, String maxPrice, List<String> sections, String section);
  Future<List<CategoryProduct>> getCategoryProducts(String categoryId, String section);

  Future<List<LatestProducts>> getFav(String userToken, String kind);
  Future<bool> addFav(String userToken, String productId, String kind);

  Future<List<Carts>> getCart(String userToken, String kind);
  Future<void> addToCart(String userToken, String kind, String productId, String count);

  Future<Profile> getProfile(String userToken, String kind);
}

class RemoteDataSourceImpl implements RemoteDataSource {

  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;

  RemoteDataSourceImpl(this._networkInfo, this._appPreferences);

  _checkNetworkAndServer() async {
    if (await _networkInfo.isConnected) {
      await _checkServer();
    } else {
      // throw Exception(AppStrings.noInternetError.tr);
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

  @override
  Future<List<LatestProducts>> search(String searchString) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}search";
    final response = await http.get(
        Uri.parse(url).replace(queryParameters: {
          'search' : searchString,
        }),
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Search Response: $responseData');
    List<LatestProducts> products = [];
    for (var singleProduct in responseData['data']['latest_products']) {
      products.add(LatestProducts.fromJson(singleProduct));
    }
    return products;
  }

  @override
  Future<List<LatestProducts>> filter(List<String> rate, String minPrice, String maxPrice, List<String> sections, String section) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}filter-products";
    final response = await http.get(
        Uri.parse(url).replace(queryParameters: {
          'min_price' : minPrice,
          'max_price' : maxPrice,
          'rate' : rate,
          'sections' : sections,
        }),
        headers: {
          'section': section,
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Filter Response: $responseData');
    List<LatestProducts> products = [];
    for (var singleProduct in responseData['data']['latest_products']) {
      products.add(LatestProducts.fromJson(singleProduct));
    }
    return products;
  }

  @override
  Future<List<CategoryProduct>> getCategoryProducts(String categoryId, String section) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}get-categories-products";
    final response = await http.get(
        Uri.parse(url).replace(queryParameters: {
          'id' : categoryId,
        }),
        headers: {
          'section': section,
        }
    );

    var responseData = json.decode(response.body);
    debugPrint('Get Categories Products Response: $responseData');
    List<CategoryProduct> products = [];
    for (var singleProduct in responseData) {
      products.add(CategoryProduct.fromJson(singleProduct));
    }
    return products;
  }

  @override
  Future<List<LatestProducts>> getFav(String userToken, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}favourites";
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization' : 'bearer $userToken',
          'kind' : kind
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Get Fav Response: $responseData');
    List<LatestProducts> products = [];
    for (var singleProduct in responseData['data']['latest_products']) {
      products.add(LatestProducts.fromJson(singleProduct));
    }
    return products;
  }

  @override
  Future<bool> addFav(String userToken, String productId, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}add-favourites";
    final response = await http.post(
        Uri.parse(url).replace(queryParameters: {
          'id' : productId,
        }),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization' : 'bearer $userToken',
          'kind' : kind
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Add Fav Response: $responseData');
    bool isAdded;
    if (responseData['message'].toString().contains('add')) {
      isAdded = true;
    } else {
      isAdded = false;
    }
    return isAdded;
  }

  @override
  Future<List<Carts>> getCart(String userToken, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}cart";
    final response = await http.get(
      Uri.parse(url),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization' : 'bearer $userToken',
          'kind' : kind
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Cart Response: $responseData');
    Cart cart = Cart.fromJson(responseData);
    return cart.data?.carts ?? [];
  }

  @override
  Future<void> addToCart(String userToken, String kind, String productId, String count) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}add-produt";
    final response = await http.post(
        Uri.parse(url).replace(queryParameters: {
          'id' : productId,
          'count' : count,
        }),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization' : 'bearer $userToken',
          'kind' : kind
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Add to Cart Response: $responseData');
  }

  @override
  Future<Profile> getProfile(String userToken, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}profile";
    final response = await http.get(
      Uri.parse(url),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization' : 'bearer $userToken',
          'kind' : kind
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Profile Response: $responseData');
    Profile profile = Profile.fromJson(responseData['data']);
    return profile;
  }

}