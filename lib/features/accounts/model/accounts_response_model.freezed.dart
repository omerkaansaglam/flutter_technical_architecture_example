// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accounts_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountsResponseModel _$AccountsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AccountsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AccountsResponseModel {
  @JsonKey(name: 'result')
  List<AccountResponseModel> get accounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountsResponseModelCopyWith<AccountsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsResponseModelCopyWith<$Res> {
  factory $AccountsResponseModelCopyWith(AccountsResponseModel value,
          $Res Function(AccountsResponseModel) then) =
      _$AccountsResponseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'result') List<AccountResponseModel> accounts,
      @JsonKey(name: 'total_count') int totalCount});
}

/// @nodoc
class _$AccountsResponseModelCopyWithImpl<$Res>
    implements $AccountsResponseModelCopyWith<$Res> {
  _$AccountsResponseModelCopyWithImpl(this._value, this._then);

  final AccountsResponseModel _value;
  // ignore: unused_field
  final $Res Function(AccountsResponseModel) _then;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountResponseModel>,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountsResponseModelCopyWith<$Res>
    implements $AccountsResponseModelCopyWith<$Res> {
  factory _$$_AccountsResponseModelCopyWith(_$_AccountsResponseModel value,
          $Res Function(_$_AccountsResponseModel) then) =
      __$$_AccountsResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'result') List<AccountResponseModel> accounts,
      @JsonKey(name: 'total_count') int totalCount});
}

/// @nodoc
class __$$_AccountsResponseModelCopyWithImpl<$Res>
    extends _$AccountsResponseModelCopyWithImpl<$Res>
    implements _$$_AccountsResponseModelCopyWith<$Res> {
  __$$_AccountsResponseModelCopyWithImpl(_$_AccountsResponseModel _value,
      $Res Function(_$_AccountsResponseModel) _then)
      : super(_value, (v) => _then(v as _$_AccountsResponseModel));

  @override
  _$_AccountsResponseModel get _value =>
      super._value as _$_AccountsResponseModel;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$_AccountsResponseModel(
      accounts: accounts == freezed
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountResponseModel>,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountsResponseModel implements _AccountsResponseModel {
  _$_AccountsResponseModel(
      {@JsonKey(name: 'result')
          required final List<AccountResponseModel> accounts,
      @JsonKey(name: 'total_count')
          required this.totalCount})
      : _accounts = accounts;

  factory _$_AccountsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountsResponseModelFromJson(json);

  final List<AccountResponseModel> _accounts;
  @override
  @JsonKey(name: 'result')
  List<AccountResponseModel> get accounts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  String toString() {
    return 'AccountsResponseModel(accounts: $accounts, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountsResponseModel &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$_AccountsResponseModelCopyWith<_$_AccountsResponseModel> get copyWith =>
      __$$_AccountsResponseModelCopyWithImpl<_$_AccountsResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountsResponseModelToJson(
      this,
    );
  }
}

abstract class _AccountsResponseModel implements AccountsResponseModel {
  factory _AccountsResponseModel(
      {@JsonKey(name: 'result')
          required final List<AccountResponseModel> accounts,
      @JsonKey(name: 'total_count')
          required final int totalCount}) = _$_AccountsResponseModel;

  factory _AccountsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_AccountsResponseModel.fromJson;

  @override
  @JsonKey(name: 'result')
  List<AccountResponseModel> get accounts;
  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_AccountsResponseModelCopyWith<_$_AccountsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
