import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user.freezed.dart';
part 'user.g.dart';


@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String firstname,
    required String lastname,
    required String phone,
    required String gender,
    required String address,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, Object> json) => _$UserFromJson(json);

}