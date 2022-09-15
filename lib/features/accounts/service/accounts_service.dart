import 'package:neyasischallenge/core/init/network/exception.dart';
import 'package:neyasischallenge/core/init/network/network_manager.dart';
import 'package:neyasischallenge/features/accounts/model/accounts_response_model.dart';
import 'package:neyasischallenge/products/enums/service_enum.dart';
import 'package:neyasischallenge/products/extensions/query_extension.dart';
import 'package:neyasischallenge/products/extensions/service_extensions.dart';

abstract class IAccountsService {
  Future<AccountsResponseModel> fetchAccounts({required int page});
  Future<bool> deleteAccounts({required String id});
}

class AccountsService extends IAccountsService {
  @override
  Future<AccountsResponseModel> fetchAccounts({required int page}) async {
    try {
      final response = await NetworkManager.instance
          .get(ServicePathEndpointEnum.users.value, queryParameters: page.parseQueryWithPage(page));
      return AccountsResponseModel.fromJson(response.data);
    } on NetworkError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> deleteAccounts({required String id}) async {
    try {
      final response = await NetworkManager.instance.delete(ServicePathEndpointEnum.users.value, id);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on NetworkError catch (e) {
      print(e);
      return false;
    }
  }
}
