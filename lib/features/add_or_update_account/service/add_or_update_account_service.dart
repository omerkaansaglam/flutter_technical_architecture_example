import 'package:dio/dio.dart';
import 'package:neyasischallenge/core/init/network/exception.dart';
import 'package:neyasischallenge/core/init/network/network_manager.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';
import 'package:neyasischallenge/products/enums/service_enum.dart';
import 'package:neyasischallenge/products/extensions/service_extensions.dart';

abstract class IAddOrUpdateAccountService {
  Future<Response?> addOrUpdateAccount({required AccountResponseModel model});
}

class AddOrUpdateAccountService extends IAddOrUpdateAccountService {
  @override
  Future<Response?> addOrUpdateAccount({required AccountResponseModel model}) async {
    try {
      final response = await NetworkManager.instance
          .postOrPut(ServicePathEndpointEnum.users.value, data: model.toJson(), id: model.id);
      return response;
    } on NetworkError catch (e) {
      print(e);
      rethrow;
    }
  }
}
