import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neyasischallenge/core/init/network/identity_manager.dart';
import 'package:neyasischallenge/core/init/router/app_router.dart';
import 'package:neyasischallenge/core/service/locator/locator.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';
import 'package:neyasischallenge/features/add_or_update_account/service/add_or_update_account_service.dart';

part 'add_or_update_account_state.dart';
part 'add_or_update_account_cubit.freezed.dart';

class AddOrUpdateAccountCubit extends Cubit<AddOrUpdateAccountState> {
  final IAddOrUpdateAccountService _addOrUpdateAccountService;
  AddOrUpdateAccountCubit(this._addOrUpdateAccountService) : super(const AddOrUpdateAccountState.initial());

  Future<void> addOrUpdateAccount({required AccountResponseModel model}) async {
    try {
      emit(const AddOrUpdateAccountState.loading());
      final parseModelIdentity = IdentityManager.instance.parseSop(model: model);
      final checkIdentity = await IdentityManager.instance.checkIdentity(data: parseModelIdentity);
      final result = await _addOrUpdateAccountService.addOrUpdateAccount(model: model);
      if (result != null && result.statusCode == 201) {
        emit(const AddOrUpdateAccountState.success(message: "Hesap oluşturma işlemi başarılı"));
        getIt<AppRouter>().pushAndPopUntil(const AccountsRoute(), predicate: (_) => false);
      } else if (result != null && result.statusCode == 200) {
        emit(const AddOrUpdateAccountState.success(message: "Güncelleme işlemi başarılı"));
        getIt<AppRouter>().pushAndPopUntil(const AccountsRoute(), predicate: (_) => false);
      } else {
        emit(const AddOrUpdateAccountState.error(exceptionError: "Üzgünüz bir hata ile karşılaştık"));
      }
    } catch (e) {
      emit(const AddOrUpdateAccountState.error(exceptionError: "Üzgünüz bir hata ile karşılaştık"));
    }
  }
}
