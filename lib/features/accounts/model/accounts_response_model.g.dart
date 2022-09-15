// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountsResponseModel _$$_AccountsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_AccountsResponseModel(
      accounts: (json['result'] as List<dynamic>)
          .map((e) => AccountResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['total_count'] as int,
    );

Map<String, dynamic> _$$_AccountsResponseModelToJson(
        _$_AccountsResponseModel instance) =>
    <String, dynamic>{
      'result': instance.accounts,
      'total_count': instance.totalCount,
    };
