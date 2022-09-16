import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neyasischallenge/core/extension/context_extension.dart';
import 'package:neyasischallenge/core/init/lang/locale_keys.g.dart';
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
      String? checkIdentity = await IdentityManager.instance.getCheck(model: model);
      if (checkIdentity != null && checkIdentity.isNotEmpty && checkIdentity == "true") {
        final result = await _addOrUpdateAccountService.addOrUpdateAccount(model: model);
        if (result != null && result.statusCode == 201) {
          emit(AddOrUpdateAccountState.success(message: LocaleKeys.createAccountSuccess.locale));
          getIt<AppRouter>().pushAndPopUntil(const AccountsRoute(), predicate: (_) => false);
        } else if (result != null && result.statusCode == 200) {
          emit(AddOrUpdateAccountState.success(message: LocaleKeys.updateAccountSuccess.locale));
          getIt<AppRouter>().pushAndPopUntil(const AccountsRoute(), predicate: (_) => false);
        } else {
          emit(AddOrUpdateAccountState.error(exceptionError: LocaleKeys.exceptionError.locale));
        }
      } else {
        emit(AddOrUpdateAccountState.error(exceptionError: LocaleKeys.exceptionIdentity.locale));
      }
    } catch (e) {
      emit(AddOrUpdateAccountState.error(exceptionError: LocaleKeys.exceptionError.locale));
    }
  }
}
