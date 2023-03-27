import 'package:green_tech_app/model/generic_response.dart';
import 'package:green_tech_app/model/user_detail_model.dart';
import 'package:green_tech_app/services/base_services/api_responss.dart';
import 'package:green_tech_app/services/base_services/base_data_source.dart';


class ProfileService extends BaseDatasource{
  Future<ApiResponse<UserDetailModel>> getUserDetail()async{
    final response = await sendGet(endpoint: 'auth/me');

    return response.transform((data) => UserDetailModel.fromJson(data));
  }


   Future<ApiResponse<GenericResponse>> logout()async{
    final response = await sendGet(endpoint: 'auth/logout');

    return response.transform((data) => GenericResponse.fromJson(data));
  }

  Future<ApiResponse<GenericResponse>> deletUser(String userId)async{
    final response = await sendDelete(endpoint: 'users/$userId');

    return response.transform((data) => GenericResponse.fromJson(data));
  }
}