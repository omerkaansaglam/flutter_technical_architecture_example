part of 'accounts_cubit.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = _Initial;
  const factory AccountsState.loading() = _Loading;
  const factory AccountsState.success(
      {required List<AccountResponseModel> accounts,
      required int totalCount,
      required int currentPage,
      required int totalPage}) = _Success;
  const factory AccountsState.error({required String message}) = _Error;
}
