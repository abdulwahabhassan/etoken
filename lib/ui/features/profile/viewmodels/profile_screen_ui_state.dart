import 'package:etoken/domain/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_screen_ui_state.freezed.dart';

@freezed
abstract class ProfileScreenUiState with _$ProfileScreenUiState {
  const factory ProfileScreenUiState({
    required User? user,
    required TextEditingController userIdTextEditingController,
    required TextEditingController nameTextEditingController,
    required TextEditingController phoneNumberTextEditingController,
    required TextEditingController addressTextEditingController,
    required TextEditingController genderTextEditingController,
    required TextEditingController emailTextEditingController,
  }) = _ProfileScreenUiState;
}
