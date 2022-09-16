// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountResponseModel _$$_AccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_AccountResponseModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      surname: json['surname'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      sallary: (json['sallary'] as num).toDouble(),
      phoneNumber: json['phone_number'] as String,
      identity: json['identity'] as int,
    );

Map<String, dynamic> _$$_AccountResponseModelToJson(
        _$_AccountResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'birth_date': instance.birthDate.toIso8601String(),
      'sallary': instance.sallary,
      'phone_number': instance.phoneNumber,
      'identity': instance.identity,
    };
