// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:resto_user/data/models/request/register_request_model.dart';
import 'package:resto_user/data/models/response/auth_response_model.dart';
import 'package:resto_user/data/remote_datasource/auth_datasource.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasource datasource;
  RegisterBloc(
    this.datasource,
  ) : super(_Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.register(event.model);
      result.fold((l) => emit(_Error()), (r) => emit(_Loaded(r)));
    });
  }
}
