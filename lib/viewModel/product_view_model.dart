import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/model/product_model.dart';
import 'package:green_tech_app/services/base_services/service_const.dart';
import 'package:green_tech_app/services/prodcut_service.dart';
import 'package:green_tech_app/services/profile_service.dart';
import 'package:green_tech_app/utils/local_storage.dart';
import 'package:green_tech_app/viewModel/base_view_model.dart';

extension SearchTransaction on List<ProductData> {
  List<ProductData> filterSearch(String searchTerm) {
    return where(
            (val) => val.name.toString().contains(searchTerm.toLowerCase()))
        .toList();
  }
}

class ProductViewModel extends BaseViewModel {
  final productService = getIt.get<ProductService>();
  ProductModel? cachedProductModel;
  ProductData? selectedProduct;
  final profileService = getIt.get<ProfileService>();

  Future<void> getAllProduct() async {
    final result = await productService.getAllProduct();

    if (!result.hasError!) {
      cachedProductModel = result.data;
      setState();
    }
  }

  void setSelectProduct(ProductData productData) {
    selectedProduct = productData;
    setState();
  }

  Future<void> catchedUserDetail() async {
    final result = await profileService.getUserDetail();

    if (!result.hasError!) {
      await getIt.get<LocalStorage>().saveUserId(result.data!.data!.id!);
      await getIt.get<LocalStorage>().saveUserEmail(result.data!.data!.email!);
      await getIt
          .get<LocalStorage>()
          .saveUserPhone('${result.data!.data!.phone!}');
      await getIt.get<LocalStorage>().saveUserName(result.data!.data!.name!);
      setState();
      logger.d(result.data!.data!.balance!);
    }
  }

  bool searchEmpty = true;
  String searchTerm = '';
  bool isSearchEmpty() => searchTerm.trim().isEmpty;

  List<ProductData>? getAllTxn() => searchEmpty
      ? cachedProductModel!.productData
      : cachedProductModel!.productData!.filterSearch(searchTerm);

  void changeSearchVisibilty(bool val, String searchTerm) {
    searchEmpty = val;
    this.searchTerm = searchTerm;
    setState();
  }
}
