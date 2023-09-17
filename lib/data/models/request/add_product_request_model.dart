// To parse this JSON data, do
//
//     final addProducttRequestModel = addProducttRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_product_request_model.freezed.dart';
part 'add_product_request_model.g.dart';

AddProductRequestModel addProducttRequestModelFromJson(String str) =>
    AddProductRequestModel.fromJson(json.decode(str));

String addProducttRequestModelToJson(AddProductRequestModel data) =>
    json.encode(data.toJson());

@freezed
class AddProductRequestModel with _$AddProductRequestModel {
  const factory AddProductRequestModel({
    required Data data,
  }) = _AddProducttRequestModel;

  factory AddProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductRequestModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required String name,
    required String description,
    required String latitude,
    required String longitude,
    required String photo,
    required String address,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime publishedAt,
    required int userId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
