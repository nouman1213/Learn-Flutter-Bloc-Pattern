import 'package:api_project_bloc/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<ProductsModel>> getProduct() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      return productsModelFromJson(response.body);
    }
    return throw Exception('Failed to load products');
  }
}
