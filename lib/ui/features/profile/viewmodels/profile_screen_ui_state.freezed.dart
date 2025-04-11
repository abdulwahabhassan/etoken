// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_screen_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileScreenUiState {

 User? get user; TextEditingController get userIdTextEditingController; TextEditingController get nameTextEditingController; TextEditingController get phoneNumberTextEditingController; TextEditingController get addressTextEditingController; TextEditingController get genderTextEditingController; TextEditingController get emailTextEditingController;
/// Create a copy of ProfileScreenUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileScreenUiStateCopyWith<ProfileScreenUiState> get copyWith => _$ProfileScreenUiStateCopyWithImpl<ProfileScreenUiState>(this as ProfileScreenUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileScreenUiState&&(identical(other.user, user) || other.user == user)&&(identical(other.userIdTextEditingController, userIdTextEditingController) || other.userIdTextEditingController == userIdTextEditingController)&&(identical(other.nameTextEditingController, nameTextEditingController) || other.nameTextEditingController == nameTextEditingController)&&(identical(other.phoneNumberTextEditingController, phoneNumberTextEditingController) || other.phoneNumberTextEditingController == phoneNumberTextEditingController)&&(identical(other.addressTextEditingController, addressTextEditingController) || other.addressTextEditingController == addressTextEditingController)&&(identical(other.genderTextEditingController, genderTextEditingController) || other.genderTextEditingController == genderTextEditingController)&&(identical(other.emailTextEditingController, emailTextEditingController) || other.emailTextEditingController == emailTextEditingController));
}


@override
int get hashCode => Object.hash(runtimeType,user,userIdTextEditingController,nameTextEditingController,phoneNumberTextEditingController,addressTextEditingController,genderTextEditingController,emailTextEditingController);

@override
String toString() {
  return 'ProfileScreenUiState(user: $user, userIdTextEditingController: $userIdTextEditingController, nameTextEditingController: $nameTextEditingController, phoneNumberTextEditingController: $phoneNumberTextEditingController, addressTextEditingController: $addressTextEditingController, genderTextEditingController: $genderTextEditingController, emailTextEditingController: $emailTextEditingController)';
}


}

/// @nodoc
abstract mixin class $ProfileScreenUiStateCopyWith<$Res>  {
  factory $ProfileScreenUiStateCopyWith(ProfileScreenUiState value, $Res Function(ProfileScreenUiState) _then) = _$ProfileScreenUiStateCopyWithImpl;
@useResult
$Res call({
 User? user, TextEditingController userIdTextEditingController, TextEditingController nameTextEditingController, TextEditingController phoneNumberTextEditingController, TextEditingController addressTextEditingController, TextEditingController genderTextEditingController, TextEditingController emailTextEditingController
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ProfileScreenUiStateCopyWithImpl<$Res>
    implements $ProfileScreenUiStateCopyWith<$Res> {
  _$ProfileScreenUiStateCopyWithImpl(this._self, this._then);

  final ProfileScreenUiState _self;
  final $Res Function(ProfileScreenUiState) _then;

/// Create a copy of ProfileScreenUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? userIdTextEditingController = null,Object? nameTextEditingController = null,Object? phoneNumberTextEditingController = null,Object? addressTextEditingController = null,Object? genderTextEditingController = null,Object? emailTextEditingController = null,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,userIdTextEditingController: null == userIdTextEditingController ? _self.userIdTextEditingController : userIdTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,nameTextEditingController: null == nameTextEditingController ? _self.nameTextEditingController : nameTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,phoneNumberTextEditingController: null == phoneNumberTextEditingController ? _self.phoneNumberTextEditingController : phoneNumberTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,addressTextEditingController: null == addressTextEditingController ? _self.addressTextEditingController : addressTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,genderTextEditingController: null == genderTextEditingController ? _self.genderTextEditingController : genderTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,emailTextEditingController: null == emailTextEditingController ? _self.emailTextEditingController : emailTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}
/// Create a copy of ProfileScreenUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc


class _ProfileScreenUiState implements ProfileScreenUiState {
  const _ProfileScreenUiState({required this.user, required this.userIdTextEditingController, required this.nameTextEditingController, required this.phoneNumberTextEditingController, required this.addressTextEditingController, required this.genderTextEditingController, required this.emailTextEditingController});
  

@override final  User? user;
@override final  TextEditingController userIdTextEditingController;
@override final  TextEditingController nameTextEditingController;
@override final  TextEditingController phoneNumberTextEditingController;
@override final  TextEditingController addressTextEditingController;
@override final  TextEditingController genderTextEditingController;
@override final  TextEditingController emailTextEditingController;

/// Create a copy of ProfileScreenUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileScreenUiStateCopyWith<_ProfileScreenUiState> get copyWith => __$ProfileScreenUiStateCopyWithImpl<_ProfileScreenUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileScreenUiState&&(identical(other.user, user) || other.user == user)&&(identical(other.userIdTextEditingController, userIdTextEditingController) || other.userIdTextEditingController == userIdTextEditingController)&&(identical(other.nameTextEditingController, nameTextEditingController) || other.nameTextEditingController == nameTextEditingController)&&(identical(other.phoneNumberTextEditingController, phoneNumberTextEditingController) || other.phoneNumberTextEditingController == phoneNumberTextEditingController)&&(identical(other.addressTextEditingController, addressTextEditingController) || other.addressTextEditingController == addressTextEditingController)&&(identical(other.genderTextEditingController, genderTextEditingController) || other.genderTextEditingController == genderTextEditingController)&&(identical(other.emailTextEditingController, emailTextEditingController) || other.emailTextEditingController == emailTextEditingController));
}


@override
int get hashCode => Object.hash(runtimeType,user,userIdTextEditingController,nameTextEditingController,phoneNumberTextEditingController,addressTextEditingController,genderTextEditingController,emailTextEditingController);

@override
String toString() {
  return 'ProfileScreenUiState(user: $user, userIdTextEditingController: $userIdTextEditingController, nameTextEditingController: $nameTextEditingController, phoneNumberTextEditingController: $phoneNumberTextEditingController, addressTextEditingController: $addressTextEditingController, genderTextEditingController: $genderTextEditingController, emailTextEditingController: $emailTextEditingController)';
}


}

/// @nodoc
abstract mixin class _$ProfileScreenUiStateCopyWith<$Res> implements $ProfileScreenUiStateCopyWith<$Res> {
  factory _$ProfileScreenUiStateCopyWith(_ProfileScreenUiState value, $Res Function(_ProfileScreenUiState) _then) = __$ProfileScreenUiStateCopyWithImpl;
@override @useResult
$Res call({
 User? user, TextEditingController userIdTextEditingController, TextEditingController nameTextEditingController, TextEditingController phoneNumberTextEditingController, TextEditingController addressTextEditingController, TextEditingController genderTextEditingController, TextEditingController emailTextEditingController
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ProfileScreenUiStateCopyWithImpl<$Res>
    implements _$ProfileScreenUiStateCopyWith<$Res> {
  __$ProfileScreenUiStateCopyWithImpl(this._self, this._then);

  final _ProfileScreenUiState _self;
  final $Res Function(_ProfileScreenUiState) _then;

/// Create a copy of ProfileScreenUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? userIdTextEditingController = null,Object? nameTextEditingController = null,Object? phoneNumberTextEditingController = null,Object? addressTextEditingController = null,Object? genderTextEditingController = null,Object? emailTextEditingController = null,}) {
  return _then(_ProfileScreenUiState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,userIdTextEditingController: null == userIdTextEditingController ? _self.userIdTextEditingController : userIdTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,nameTextEditingController: null == nameTextEditingController ? _self.nameTextEditingController : nameTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,phoneNumberTextEditingController: null == phoneNumberTextEditingController ? _self.phoneNumberTextEditingController : phoneNumberTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,addressTextEditingController: null == addressTextEditingController ? _self.addressTextEditingController : addressTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,genderTextEditingController: null == genderTextEditingController ? _self.genderTextEditingController : genderTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,emailTextEditingController: null == emailTextEditingController ? _self.emailTextEditingController : emailTextEditingController // ignore: cast_nullable_to_non_nullable
as TextEditingController,
  ));
}

/// Create a copy of ProfileScreenUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
