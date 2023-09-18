// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:resto_user/data/models/request/login_request_model.dart';
import 'package:resto_user/data/models/response/auth_response_model.dart';
import 'package:resto_user/data/remote_datasource/auth_datasource.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasource datasource;
  LoginBloc(
    this.datasource,
  ) : super(_Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.login(event.model);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
