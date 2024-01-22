import 'dart:convert';

import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/data/network_info.dart';
import 'package:ecommerce/domain/models/cart/cart.dart';
import 'package:ecommerce/domain/models/category_product.dart';
import 'package:ecommerce/domain/models/home/home_data.dart';
import 'package:ecommerce/domain/models/order.dart';
import 'package:ecommerce/domain/models/order_details.dart';
import 'package:ecommerce/domain/models/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/my_response.dart';
import '../local/local_data_source.dart';
import '../../domain/models/profile.dart';

abstract class RemoteDataSource {
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();
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
  Future<void> removeFromCart(String cartId);

  Future<List<Order>> getOrders(String userToken, String kind);
  Future<void> finishOrder(String userToken, String kind, String firstName, String lastName, String phone, String address, String payType);
  Future<OrderDetails> getOrderDetails(String userToken, String kind, String orderId);

  Future<Profile> getProfile(String userToken, String kind);
  Future<List<Carts>> getProductsFromId(String ids);
}

const List<String> scopes = <String>[
  'email'
];

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: scopes,);

class RemoteDataSourceImpl implements RemoteDataSource {

  final NetworkInfo _networkInfo;
  final LocalDataSource _appPreferences;

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
  Future<void> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email'],
    );
    if (result.status == LoginStatus.success) {
      // you are logged
      final userData = await FacebookAuth.instance.getUserData();
      debugPrint('userData = $userData');
      String userName = userData['name'];
      String email = userData['email'];
      debugPrint('userName = $userName');
      debugPrint('email = $email');

      // await register(null, userName, _appPreferences.getKind(), email, null, null).then((value) {
        _appPreferences.setUserLoginType('facebook');
        _appPreferences.setUserLoggedIn();
      // });
    } else {
      debugPrint(result.status.toString());
      debugPrint(result.message);
      throw Exception(result.message);
    }
  }

  void _signOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
  }

  @override
  Future<void> loginWithGoogle() async {
    try {
      _googleSignIn.onCurrentUserChanged
          .listen((GoogleSignInAccount? currentUser) async {
        String userName = currentUser?.displayName ?? '';
        String email = currentUser?.email ?? '';
        // String phone = currentUser?.phone ?? '';
        debugPrint('userName = $userName');
        debugPrint('email = $email');

        // await register(null, userName, _appPreferences.getKind(), email, null, null).then((value) {
          _appPreferences.setUserLoginType('google');
          _appPreferences.setUserLoggedIn();
        // });
      });
      await _googleSignIn.signIn();
    } catch (error) {
      throw(Exception(error.toString()));
    }
  }

  void _signOutFromGoogle() {
    _googleSignIn.disconnect();
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
  Future<void> register(String? phoneNumber, String name, String kind, String email, String? password, String? conPassword) async {
    debugPrint('Register Response: REGISTERING');
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
  Future<void> removeFromCart(String cartId) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}delete-cart-item";
    final response = await http.post(
        Uri.parse(url).replace(queryParameters: {
          'id' : cartId,
        }),
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Remove from Cart Response: $responseData');
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

  @override
  Future<List<Order>> getOrders(String userToken, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}my-orders";
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization' : 'bearer $userToken',
          'kind': kind
        }
    );

    var responseData = json.decode(response.body);
    _checkResponse(responseData);
    debugPrint('Get Orders Response: $responseData');
    OrderResponse order = OrderResponse.fromJson(responseData);
    return order.data?.orders ?? [];
  }

  @override
  Future<void> finishOrder(String userToken, String kind, String firstName, String lastName, String phone, String address, String payType) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}finish-order";
    final response = await http.post(
        Uri.parse(url).replace(queryParameters: {
          'name_first' : firstName,
          'name_last' : lastName,
          'phone' : phone,
          'address' : address,
          'pay_type' : payType,
        }),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization': 'bearer $userToken',
          'kind': kind
        }
    );

    var responseData = json.decode(response.body);
    debugPrint('Finish Order Response: $responseData');
    _checkResponse(responseData);
  }

  @override
  Future<OrderDetails> getOrderDetails(String userToken, String kind, String orderId) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}detials-order";
    final response = await http.get(
        Uri.parse(url).replace(queryParameters: {
          'id' : orderId,
        }),
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'charset': 'utf-8',
          'authorization': 'bearer $userToken',
          'kind': kind
        }
    );

    var responseData = json.decode(response.body);
    debugPrint('Get Order Details Response: $responseData');
    _checkResponse(responseData);
    OrderDetails orderDetails = OrderDetails.fromJson(responseData);
    return orderDetails;
  }

  @override
  Future<List<Carts>> getProductsFromId(String ids) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}get-product-detials$ids";
    debugPrint('---------- url $url');
    final response = await http.get(Uri.parse(url),);

    var responseData = json.decode(response.body);
    // _checkResponse(responseData);
    debugPrint('Get Products From Id Response: $responseData');
    List<Carts> carts = [];
    for (var singleProduct in responseData['datas']) {
      carts.add(Carts.fromJson2(singleProduct));
    }
    return carts;
  }

}