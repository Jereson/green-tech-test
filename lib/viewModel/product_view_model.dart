import 'package:flutter/cupertino.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/model/product_model.dart';
import 'package:green_tech_app/model/user_detail_model.dart';
import 'package:green_tech_app/services/base_services/service_const.dart';
import 'package:green_tech_app/services/prodcut_service.dart';
import 'package:green_tech_app/services/profile_service.dart';
import 'package:green_tech_app/utils/local_storage.dart';
import 'package:green_tech_app/viewModel/base_view_model.dart';

//Impelent searching feature
extension SearchTerm on List<ProductData> {
  List<ProductData> filterSearch(String searchTerm) {
    return where(
            (val) => val.name!.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}

class ProductViewModel extends BaseViewModel {
  final productService = getIt.get<ProductService>();
  ProductModel? cachedProductModel;
  ProductData? selectedProduct;
  UserDetailModel? userDetailModel;

  // List<ProductData> productList =[];
  final profileService = getIt.get<ProfileService>();

  bool searchEmpty = true;
  String searchTerm = '';
  bool isSearchEmpty() => searchTerm.trim().isEmpty;

  final searchController = TextEditingController();

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
      //Catch basic user details
      await getIt.get<LocalStorage>().saveUserId(result.data!.data!.id!);
      await getIt.get<LocalStorage>().saveUserEmail(result.data!.data!.email!);
      await getIt
          .get<LocalStorage>()
          .saveUserPhone('${result.data!.data!.phone!}');
      await getIt.get<LocalStorage>().saveUserName(result.data!.data!.name!);
      userDetailModel = result.data!;
      setState();
      logger.d(result.data!.data!.balance!);
    }
  }

//Get searched resul and unsearch into single
  List<ProductData>? getAllProductList() => searchEmpty
      ? cachedProductModel!.productData
      : cachedProductModel!.productData!.filterSearch(searchTerm);

  void changeSearchVisibilty(bool val, String searchTerm) {
    searchEmpty = val;
    this.searchTerm = searchTerm;
    setState();
  }
}
