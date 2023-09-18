part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.loaded(AuthResponseModel model) = _Loaded;
  //Loaded di ambil dari response AuthResponseModel
  const factory RegisterState.error() = _Error;
}
