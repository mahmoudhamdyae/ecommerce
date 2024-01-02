abstract class Repository {

  Future<void> login(String phoneNumber, String password);
  Future<void> confirmPhoneNumber(String phoneNumber);
}