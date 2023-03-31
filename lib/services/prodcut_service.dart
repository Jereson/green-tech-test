import 'package:green_tech_app/model/product_model.dart';
import 'package:green_tech_app/services/base_services/api_responss.dart';
import 'package:green_tech_app/services/base_services/base_data_source.dart';

class ProductService extends BaseDatasource {
  Future<ApiResponse<ProductModel>> getAllProduct() async {
    final response = await sendGet(endpoint: 'products');

    return response.transform((data) => ProductModel.fromJson(data));
  }
}
