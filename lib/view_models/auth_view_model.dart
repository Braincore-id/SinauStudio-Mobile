import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinau_studio/models/user_model.dart';
import 'package:sinau_studio/services/auth_service.dart';
import 'package:sinau_studio/utils/error_message.dart';
import 'package:sinau_studio/utils/finite_state.dart';

class AuthViewModel extends ChangeNotifier with FiniteState, ErrorMessage {
  final _authService = AuthService();

  Future<String?> signUp(UserModel user) async {
    try {
      final result = await _authService.signUp(user);
      // result["message"];
      return result;
    } catch (e) {
      if (e is DioError) {
        return e.response!.data['message'];
      }
    }
    notifyListeners();
    return null;
  }

  Future<int?> login(UserModel user) async {
    try {
      final result = await _authService.login(user);
      notifyListeners();
      return result["status_code"];
    } catch (e) {
      return null;
    }
  }

  Future<String?> logout() async {
    try {
      final helper = await SharedPreferences.getInstance();
      await helper.remove('token');
      notifyListeners();
      return 'Logout succesful';
    } catch (e) {
      return null;
    }
  }
}

final authViewModel = ChangeNotifierProvider<AuthViewModel>(
  (ref) => AuthViewModel(),
);
