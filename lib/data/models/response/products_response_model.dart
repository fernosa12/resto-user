// To parse this JSON data, do
//
//     final productsResponseModel = productsResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:resto_user/data/models/response/add_product_response_model.dart';

part 'products_response_model.freezed.dart';
part 'products_response_model.g.dart';

ProductsResponseModel productsResponseModelFromJson(String str) =>
    ProductsResponseModel.fromJson(json.decode(str));

String productsResponseModelToJson(ProductsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class ProductsResponseModel with _$ProductsResponseModel {
  const factory ProductsResponseModel({
    required List<Restaurant> data,
    required Meta meta,
  }) = _ProductsResponseModel;

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required Pagination pagination,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int pageSize,
    required int pageCount,
    required int total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
