import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:resto_user/common/constant.dart';
import 'package:resto_user/data/local_datasource/auth_local_datasource.dart';
import 'package:resto_user/data/models/request/add_product_request_model.dart';
import 'package:resto_user/data/models/response/add_product_response_model.dart';

import 'package:resto_user/data/models/response/products_response_model.dart';

class RestaurantDataSource {
  Future<Either<String, ProductsResponseModel>> getAll() async {
    final response = await http.get(
        Uri.parse("${Constants.baseUrl}/api/restaurant"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Gagal');
    }
  }

  Future<Either<String, AddProductResponseModel>> addProduct(
      AddProductRequestModel model) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
        Uri.parse("${Constants.baseUrl}/api/restaurant"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer {token}',
        });
    body:
    jsonEncode(model.toString());
    if (response.statusCode == 200) {
      return Right(AddProductResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Gagal');
    }
  }
}
