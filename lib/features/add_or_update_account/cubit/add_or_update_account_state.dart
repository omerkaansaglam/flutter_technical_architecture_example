part of 'add_or_update_account_cubit.dart';

@freezed
class AddOrUpdateAccountState with _$AddOrUpdateAccountState {
  const factory AddOrUpdateAccountState.initial() = _Initial;
  const factory AddOrUpdateAccountState.loading() = _Loading;
  const factory AddOrUpdateAccountState.success({required String message}) = _Success;
  const factory AddOrUpdateAccountState.error({required String exceptionError}) = _Error;
}
