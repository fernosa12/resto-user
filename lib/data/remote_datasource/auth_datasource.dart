import 'dart:convert';

import 'package:resto_user/common/constant.dart';
import 'package:resto_user/data/models/request/login_request_model.dart';
import 'package:resto_user/data/models/request/register_request_model.dart';
import 'package:resto_user/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthDatasource {
  Future<Either<String, AuthResponseModel>> register(
      //Penggunaan Either adalah salah satu cara untuk menggunakan-
      //Package Dartz
      RegisterRequestModel registerData) async {
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/local'),
        body: jsonEncode(registerData.toJson()),
        headers: <String, String>{'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Register gagal');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      //Penggunaan Either adalah salah satu cara untuk menggunakan-
      //Package Dartz
      LoginRequestModel model) async {
    final response = await http.post(
        Uri.parse('${Constants.baseUrl}/api/auth/local'),
        body: jsonEncode(model.toJson()),
        headers: <String, String>{'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Login gagal');
    }
  }
}
