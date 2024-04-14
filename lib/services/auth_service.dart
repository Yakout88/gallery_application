import 'package:dio/dio.dart';

import '../models/user_model.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<User> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://flutter.prominaagency.com/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return User.fromJson(response.data['user']);
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }
}
