import 'package:ecommerce/data/remote/remote_data_source.dart';
import 'package:ecommerce/domain/repository/repository.dart';

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
}