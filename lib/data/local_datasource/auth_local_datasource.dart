import 'dart:convert';

import 'package:resto_user/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<bool> saveAuthData(AuthResponseModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await prefs.setString('auth', jsonEncode(model.toJson()));
    return res;
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData.jwt;
  }
}
