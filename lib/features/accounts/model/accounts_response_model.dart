import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neyasischallenge/features/add_or_update_account/model/account_response_model.dart';

part 'accounts_response_model.freezed.dart';
part 'accounts_response_model.g.dart';

@freezed
class AccountsResponseModel with _$AccountsResponseModel {
  factory AccountsResponseModel({
    @JsonKey(name: 'result') required List<AccountResponseModel> accounts,
    @JsonKey(name: 'total_count') required int totalCount,
  }) = _AccountsResponseModel;

  factory AccountsResponseModel.fromJson(Map<String, dynamic> json) => _$AccountsResponseModelFromJson(json);
}

extension AccountsModelExtension on AccountsResponseModel {
  int get totalPage => (totalCount / 10).ceil();
}
