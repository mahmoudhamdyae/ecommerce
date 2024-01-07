import '../models/category_product.dart';
import '../models/home/home_data.dart';
import '../models/product/product.dart';

abstract class Repository {

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
}