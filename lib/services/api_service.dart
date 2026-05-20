import 'package:dio/dio.dart';
import 'package:iqraamarktask/core/constant/api_constants.dart';
import 'package:iqraamarktask/core/network/dio_client.dart';
import 'package:iqraamarktask/models/user_model.dart';

class ApiService {
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await DioClient.dio.get(ApiConstants.usersEndpoint);

      if (response.statusCode == 200) {
        final List data = response.data;

        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed with status code ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
