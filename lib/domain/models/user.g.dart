// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  firstname: json['firstname'] as String,
  lastname: json['lastname'] as String,
  phone: json['phone'] as String,
  gender: json['gender'] as String,
  address: json['address'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'phone': instance.phone,
  'gender': instance.gender,
  'address': instance.address,
  'email': instance.email,
};
