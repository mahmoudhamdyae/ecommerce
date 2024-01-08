import '../models/cart/cart.dart';
import '../models/category_product.dart';
import '../models/home/home_data.dart';
import '../models/product/product.dart';
import '../models/profile.dart';

abstract class Repository {

  // Authentication
  Future<void> login(String phoneNumber, String password);
  Future<void> confirmPhoneNumber(String phoneNumber);
  Future<void> enterCode(String phoneNumber, String code);
  Future<void> register(String phoneNumber, String name, String email, String password, String conPassword);

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

  Future<Profile> getProfile();
}