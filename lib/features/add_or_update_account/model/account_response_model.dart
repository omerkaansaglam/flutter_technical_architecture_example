import 'package:freezed_annotation/freezed_annotation.dart';

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
  String get fullName => 'Ad Soyad : $name $surname';
  String get sallaryWithCurrentSembol => 'Maaş : $sallary ₺';
  String get phone => 'Telefon : $phoneNumber';
  String get identityNumber => 'Identity : $identity';
  String get age =>
      'Yaş : ${(birthDate.year - DateTime.now().year).isNegative ? 0 : birthDate.year - DateTime.now().year}';
}
