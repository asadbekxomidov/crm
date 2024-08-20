import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final dio = Dio();
  final String _tokenKey = 'auth_token';

  Future<void> registerUser(String name, String phone, String password,
      String passwordConfirmation) async {
    try {
      final response = await dio.post(
        'http://millima.flutterwithakmaljon.uz/api/register',
        data: {
          "name": name,
          "phone": phone,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      final token = response.data['token'];
      if (token != null) {
        await _saveToken(token);
      }
    } on DioException catch (error) {
      throw Exception(error.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> loginUser(String phone, String password) async {
    try {
      final response = await dio.post(
        'http://millima.flutterwithakmaljon.uz/api/login',
        data: {
          "phone": phone,
          "password": password,
        },
      );
      return response;
    } on DioException catch (error) {
      print(error.message.toString());
      rethrow;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      final response = await dio.post(
        'http://millima.flutterwithakmaljon.uz/api/logout',
        options: Options(headers: {
          'Authorization': 'Bearer ${await getToken()}',
        }),
      );
      if (response.statusCode == 200) {
      } else {
        throw Exception('Logout failed with status: ${response.statusCode}');
      }
    } on DioException catch (error) {
      throw Exception('Dio error: ${error.message}');
    } catch (e) {
      throw Exception('Logout error: ${e.toString()}');
    }
  }

  // Future<String> getToken() async {
  //   return 'your_token_here';
  // }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) ?? '';
  }

  Future<void> _deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<bool> isAuthenticated() async {
    try {
      final response = await dio.get(
        'http://millima.flutterwithakmaljon.uz/api/check-auth',
        options: Options(headers: {
          'Authorization': 'Bearer ${await getToken()}',
        }),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final response = await dio.get(
        'http://millima.flutterwithakmaljon.uz/api/user',
        // 'http://millima.flutterwithakmaljon.uz/api/user-profile',
        options: Options(headers: {
          'Authorization': 'Bearer ${await getToken()}',
        }),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load user profile');
      }
    } on DioException catch (error) {
      throw Exception('Dio error: ${error.message}');
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
