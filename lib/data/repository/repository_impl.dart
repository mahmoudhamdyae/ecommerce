import 'package:ecommerce/data/remote/remote_data_source.dart';
import 'package:ecommerce/domain/repository/repository.dart';

class RepositoryImpl implements Repository {

  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<void> login(String phoneNumber, String password) async {
    await _remoteDataSource.login(phoneNumber, password);
  }

  @override
  Future<void> confirmPhoneNumber(String phoneNumber) async {
    await _remoteDataSource.confirmPhoneNumber(phoneNumber);
  }
}