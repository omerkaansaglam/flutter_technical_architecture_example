// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountResponseModel _$AccountResponseModelFromJson(Map<String, dynamic> json) {
  return _AccountResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AccountResponseModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  DateTime get birthDate => throw _privateConstructorUsedError;
  double get sallary => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  int get identity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountResponseModelCopyWith<AccountResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountResponseModelCopyWith<$Res> {
  factory $AccountResponseModelCopyWith(AccountResponseModel value,
          $Res Function(AccountResponseModel) then) =
      _$AccountResponseModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String name,
      String surname,
      @JsonKey(name: 'birth_date') DateTime birthDate,
      double sallary,
      @JsonKey(name: 'phone_number') String phoneNumber,
      int identity});
}

/// @nodoc
class _$AccountResponseModelCopyWithImpl<$Res>
    implements $AccountResponseModelCopyWith<$Res> {
  _$AccountResponseModelCopyWithImpl(this._value, this._then);

  final AccountResponseModel _value;
  // ignore: unused_field
  final $Res Function(AccountResponseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? birthDate = freezed,
    Object? sallary = freezed,
    Object? phoneNumber = freezed,
    Object? identity = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sallary: sallary == freezed
          ? _value.sallary
          : sallary // ignore: cast_nullable_to_non_nullable
              as double,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      identity: identity == freezed
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountResponseModelCopyWith<$Res>
    implements $AccountResponseModelCopyWith<$Res> {
  factory _$$_AccountResponseModelCopyWith(_$_AccountResponseModel value,
          $Res Function(_$_AccountResponseModel) then) =
      __$$_AccountResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String name,
      String surname,
      @JsonKey(name: 'birth_date') DateTime birthDate,
      double sallary,
      @JsonKey(name: 'phone_number') String phoneNumber,
      int identity});
}

/// @nodoc
class __$$_AccountResponseModelCopyWithImpl<$Res>
    extends _$AccountResponseModelCopyWithImpl<$Res>
    implements _$$_AccountResponseModelCopyWith<$Res> {
  __$$_AccountResponseModelCopyWithImpl(_$_AccountResponseModel _value,
      $Res Function(_$_AccountResponseModel) _then)
      : super(_value, (v) => _then(v as _$_AccountResponseModel));

  @override
  _$_AccountResponseModel get _value => super._value as _$_AccountResponseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? surname = freezed,
    Object? birthDate = freezed,
    Object? sallary = freezed,
    Object? phoneNumber = freezed,
    Object? identity = freezed,
  }) {
    return _then(_$_AccountResponseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sallary: sallary == freezed
          ? _value.sallary
          : sallary // ignore: cast_nullable_to_non_nullable
              as double,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      identity: identity == freezed
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountResponseModel implements _AccountResponseModel {
  _$_AccountResponseModel(
      {this.id,
      required this.name,
      required this.surname,
      @JsonKey(name: 'birth_date') required this.birthDate,
      required this.sallary,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      required this.identity});

  factory _$_AccountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountResponseModelFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String surname;
  @override
  @JsonKey(name: 'birth_date')
  final DateTime birthDate;
  @override
  final double sallary;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final int identity;

  @override
  String toString() {
    return 'AccountResponseModel(id: $id, name: $name, surname: $surname, birthDate: $birthDate, sallary: $sallary, phoneNumber: $phoneNumber, identity: $identity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountResponseModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.surname, surname) &&
            const DeepCollectionEquality().equals(other.birthDate, birthDate) &&
            const DeepCollectionEquality().equals(other.sallary, sallary) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.identity, identity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(surname),
      const DeepCollectionEquality().hash(birthDate),
      const DeepCollectionEquality().hash(sallary),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(identity));

  @JsonKey(ignore: true)
  @override
  _$$_AccountResponseModelCopyWith<_$_AccountResponseModel> get copyWith =>
      __$$_AccountResponseModelCopyWithImpl<_$_AccountResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountResponseModelToJson(
      this,
    );
  }
}

abstract class _AccountResponseModel implements AccountResponseModel {
  factory _AccountResponseModel(
      {final String? id,
      required final String name,
      required final String surname,
      @JsonKey(name: 'birth_date') required final DateTime birthDate,
      required final double sallary,
      @JsonKey(name: 'phone_number') required final String phoneNumber,
      required final int identity}) = _$_AccountResponseModel;

  factory _AccountResponseModel.fromJson(Map<String, dynamic> json) =
      _$_AccountResponseModel.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get surname;
  @override
  @JsonKey(name: 'birth_date')
  DateTime get birthDate;
  @override
  double get sallary;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  int get identity;
  @override
  @JsonKey(ignore: true)
  _$$_AccountResponseModelCopyWith<_$_AccountResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
