// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:resto_user/data/models/response/products_response_model.dart';
import 'package:resto_user/data/remote_datasource/restaurant_datasource.dart';

part 'get_all_product_bloc.freezed.dart';
part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final RestaurantDataSource dataSource;
  GetAllProductBloc(
    this.dataSource,
  ) : super(_Initial()) {
    on<_Get>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.getAll();
      result.fold((l) => Error(), (data) => _Loaded(data));
    });
  }
}
