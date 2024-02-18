import '../models/cart/cart.dart';
import '../models/category_product.dart';
import '../models/home/home_data.dart';
import '../models/order.dart';
import '../models/order_details.dart';
import '../models/product/product.dart';
import '../models/profile.dart';

abstract class Repository {

  // Local Data Source
  Future<void> setUserLoggedIn();
  bool isUserLoggedIn();
  Future<void> logout();
  Future<void> setUserLoginType(String type);
  Future<void> setToken(String token);
  Future<void> setLanguage(String language);
  String getLang();
  Future<void> setStoreType(String storeType);
  String getStoreType();
  Future<void> setKind(String kind);
  Future<void> addToCartLocal(String productId);
  Future<void> removeFromCartLocal(String productId);
  Future<void> removeAllFromCart();
  bool isInCart(String productId);
  List<String> getLocalProducts();

  // Authentication
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();
  Future<void> login(String phoneNumber, String password);
  Future<void> confirmPhoneNumber(String phoneNumber);
  Future<void> enterCode(String phoneNumber, String code);
  Future<void> register(String phoneNumber, String name, String email, String password, String conPassword);
  Future<void> sendNumber(String phoneNumber);
  Future<void> resetPassword(String phoneNumber, String code, String password);

  // Remote Data Source
  Future<HomeData> getHomeData();
  Future<String> getAboutUs();
  Future<Product> getProductDetails(String id);
  Future<List<LatestProducts>> getLatestProducts();
  Future<List<LatestProducts>> getBestSellerProducts();
  Future<List<LatestProducts>> search(String searchString);
  Future<List<LatestProducts>> filter(List<String> rate, String minPrice, String maxPrice, List<String> sections);
  Future<List<CategoryProduct>> getCategoryProducts(String categoryId);

  Future<List<LatestProducts>> getFav();
  Future<bool> addFav(String productId);

  Future<List<Carts>> getCart();
  Future<void> addToCart(String productId, String count);
  Future<void> removeFromCart(String cartId);

  Future<List<Order>> getOrders();
  Future<void> finishOrder(String firstName, String lastName, String phone, String address, String payType);
  Future<OrderDetails> getOrderDetails(String orderId);

  Future<Profile> getProfile();
  Future<List<Carts>> getProductsFromId(String ids);

  Future<void> addToFavLocal(String productId);
  Future<void> removeFromFavLocal(String productId);
  Future<void> removeAllFromFavLocal();
  bool isInFavLocal(String productId);
  List<String> getLocalFavProductsLocal();
}