import 'package:green_tech_app/model/generic_response.dart';
import 'package:green_tech_app/model/login_response.dart';
import 'package:green_tech_app/services/base_services/api_responss.dart';
import 'package:green_tech_app/services/base_services/base_data_source.dart';

class AuthService extends BaseDatasource{
   Future<ApiResponse<GenericResponse>> signupUser(
      {String? name, String? email, String? password, String? phone}) async {
    final response = await sendPost(
        useToken: false,
        endpoint: 'auth/register',
        payload: {
          "name":name,
          "email": email,
          'phone':phone,
          "password": password,
          "role": 'buyer'
        });
    return response.transform((data) => GenericResponse.fromJson(data));
  }

   Future<ApiResponse<LoginResponse>> signinUser(
      String? email,String? password) async {
    final response = await sendPost(
        useToken: false,
        endpoint: 'auth/login',
        payload: {
          "email": email,
          "password": password
       
        });
    return response.transform((data) => LoginResponse.fromJson(data));
  }

  
}