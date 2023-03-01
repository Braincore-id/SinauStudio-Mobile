import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinau_studio/models/user_model.dart';
import 'package:sinau_studio/utils/constant/url_constant.dart';

final _dio = Dio(
  BaseOptions(
    baseUrl: UrlConstant.baseURL,
  ),
);

class AuthService {
  AuthService() {
    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       final share = await SharedPreferences.getInstance();
    //       final token = share.getString("token");
    //       options.headers["Authorization"] = "Bearer $token";
    //     },
    //   ),
    // );
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
  }

  Future signUp(UserModel user) async {
    try {
      final response = await _dio.post(
        "/api/v.1/auth/register",
        data: {
          "email": user.email,
          "password": user.password,
          "name": user.name,
          "role": user.role,
          "kode_kelas": "57XP95ML8R"
        },
      );
      return response.data;
    } catch (e) {
      return "Error Dio";
    }
  }

  Future login(UserModel user) async {
    try {
      final Response response = await _dio.post(
        "/api/v.1/auth/login",
        data: {
          "email": user.email,
          "password": user.password,
        },
      );
      if (response.statusCode == 200 && response.data != null) {
        final String token = response.data['data']['token'];
        final helper = await SharedPreferences.getInstance();
        await helper.setString('token', token);
        return response.data;
      } else {
        print("ini response datanya: ${response.data}");
        return response.data;
      }
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
