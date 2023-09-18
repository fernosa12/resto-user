// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:resto_user/data/models/request/add_product_request_model.dart';
import 'package:resto_user/data/models/response/add_product_response_model.dart';
import 'package:resto_user/data/remote_datasource/restaurant_datasource.dart';

part 'add_product_bloc.freezed.dart';
part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final RestaurantDataSource dataSource;
  AddProductBloc(
    this.dataSource,
  ) : super(_Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.addProduct(event.model);
    });
  }
}
