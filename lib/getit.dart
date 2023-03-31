
import 'package:get_it/get_it.dart';
import 'package:green_tech_app/services/auth_service.dart';
import 'package:green_tech_app/services/cart_service.dart';
import 'package:green_tech_app/services/prodcut_service.dart';
import 'package:green_tech_app/services/profile_service.dart';
import 'package:green_tech_app/utils/local_storage.dart';
import 'package:green_tech_app/viewModel/auth_view_model.dart';
import 'package:green_tech_app/viewModel/base_view_model.dart';
import 'package:green_tech_app/viewModel/cart_vm.dart';
import 'package:green_tech_app/viewModel/product_view_model.dart';
import 'package:green_tech_app/viewModel/profile_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup()  async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => LocalStorage(sharedPreferences));

  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<ProfileService>(ProfileService());
  getIt.registerSingleton<ProductService>(ProductService());
  getIt.registerSingleton<CartServices>(CartServices());


  getIt.registerSingleton<BaseViewModel>(BaseViewModel());
  getIt.registerSingleton<AuthViewModel>(AuthViewModel());
  getIt.registerSingleton<ProfileViewModel>(ProfileViewModel());
  getIt.registerSingleton<CartViewModel>(CartViewModel());
  getIt.registerSingleton<ProductViewModel>(ProductViewModel());
  
  
}