import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neyasischallenge/core/extension/context_extension.dart';
import 'package:neyasischallenge/core/init/lang/locale_keys.g.dart';

part 'account_response_model.freezed.dart';
part 'account_response_model.g.dart';

@freezed
class AccountResponseModel with _$AccountResponseModel {
  factory AccountResponseModel({
    String? id,
    required String name,
    required String surname,
    @JsonKey(name: 'birth_date') required DateTime birthDate,
    required double sallary,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required int identity,
  }) = _AccountResponseModel;

  factory AccountResponseModel.fromJson(Map<String, dynamic> json) => _$AccountResponseModelFromJson(json);
}

extension AccountModelExtension on AccountResponseModel {
  String get fullName => '${LocaleKeys.fullName.locale} : $name $surname';
  String get sallaryWithCurrentSembol =>
      '${LocaleKeys.sallary.locale} : $sallary ${LocaleKeys.currencySembol.locale}';
  String get phone => '${LocaleKeys.phone.locale} : $phoneNumber';
  String get identityNumber => '${LocaleKeys.identity.locale} : $identity';
  String get age =>
      '${LocaleKeys.age.locale} : ${(DateTime.now().year - birthDate.year).isNegative ? 0 : DateTime.now().year - birthDate.year}';
}
