import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neyasischallenge/features/accounts/model/accounts_response_model.dart';
import 'package:neyasischallenge/features/accounts/service/accounts_service.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';

part 'accounts_state.dart';
part 'accounts_cubit.freezed.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final IAccountsService _iAccountsService;
  AccountsCubit(this._iAccountsService) : super(const AccountsState.initial()) {
    getAccounts(page: 1);
  }

  Future<void> getAccounts({required int page}) async {
    try {
      emit(const AccountsState.loading());
      final result = await _iAccountsService.fetchAccounts(page: page);
      final totalPage = result.totalPage;
      emit(AccountsState.success(
          accounts: result.accounts, totalCount: result.totalCount, totalPage: totalPage, currentPage: page));
    } catch (e) {
      print(e);
      emit(const AccountsState.error(message: 'Üzgünüz bir hata ile karşılaştık'));
      rethrow;
    }
  }

  Future<void> nextOrBackAccounts({required bool isNext}) async {
    state.maybeMap(
      orElse: () {},
      success: (result) async =>
          await getAccounts(page: isNext ? result.currentPage + 1 : result.currentPage - 1),
    );
  }

  Future<void> deleteAccount({required String id, required currentPage}) async {
    try {
      final response = await _iAccountsService.deleteAccounts(id: id);
      if (response) {
        getAccounts(page: currentPage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
