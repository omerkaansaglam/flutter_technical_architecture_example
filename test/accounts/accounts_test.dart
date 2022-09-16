import 'package:neyasischallenge/features/accounts/service/accounts_service.dart';
import 'package:test/test.dart';

void main() {
  group('Account List Test', () {
    test('Fetch Account List From MockApi', () async {
      final IAccountsService accountService = AccountsService();
      final result = await accountService.fetchAccounts(page: 1);
      expect(result.accounts, isNotEmpty);
    });
  });
}
