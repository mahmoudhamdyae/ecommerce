import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/data/network_info.dart';
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

  @override
  Future<void> login(String phoneNumber, String password, String kind) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}auth/login?&password=$password&phone=$phoneNumber";
    final response = await http.post(Uri.parse(url));

    var responseData = json.decode(response.body);
    debugPrint('Login Response: $responseData');
    if (responseData["access_token"] == null) {
      throw Exception(AppStrings.wrongPhoneOrPassword);
    }
    _appPreferences.setToken('');
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
  }

  @override
  Future<void> register(String phoneNumber, String name, String kind, String email, String password, String conPassword) async {
    await _checkNetworkAndServer();
    String url = "${AppConstants.baseUrl}register-info?kind=$kind&phone=$phoneNumber&name=$name&email=$email&password=$password&con_password=$conPassword";
    debugPrint('Register url: $url');
    final response = await http.post(Uri.parse(url));

    var responseData = json.decode(response.body);
    debugPrint('Register Response: $responseData');
  }
}