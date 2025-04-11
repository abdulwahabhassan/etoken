import 'package:etoken/data/repositories/repository_provider.dart';
import 'package:etoken/ui/features/profile/viewmodels/profile_screen_ui_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/models/user.dart';

part 'profile_screen_viewmodel.g.dart';

@riverpod
class ProfileScreenViewModel extends _$ProfileScreenViewModel {
  @override
  Future<ProfileScreenUiState> build() async {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    User user = await ref.watch(userRepositoryProvider).getUser();
    return ProfileScreenUiState(
      user: user,
      userIdTextEditingController: TextEditingController(text: user.id),
      nameTextEditingController: TextEditingController(
        text: "${user.firstname} ${user.lastname}",
      ),
      phoneNumberTextEditingController: TextEditingController(text: user.phone),
      addressTextEditingController: TextEditingController(text: user.address),
      genderTextEditingController: TextEditingController(text: user.gender),
      emailTextEditingController: TextEditingController(text: user.email),
    );
  }


  Future<void> saveProfile() async {
    state = const AsyncLoading();
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    User user = User(
      id: "ET02992",
      firstname: "Hassan",
      lastname: "Adams",
      phone: "08167039661",
      gender: "Male",
      address: "32, 322 Road, Gwarinpa, FCT, Abuja",
      email: 'devhassan.org@gmail.com',
    );
    // await Future.delayed(Duration(seconds: 3,));
    state = AsyncData(ProfileScreenUiState(
      user: user,
      userIdTextEditingController: TextEditingController(text: user.id),
      nameTextEditingController: TextEditingController(
        text: "${user.firstname} ${user.lastname}",
      ),
      phoneNumberTextEditingController: TextEditingController(text: user.phone),
      addressTextEditingController: TextEditingController(text: user.address),
      genderTextEditingController: TextEditingController(text: user.gender),
      emailTextEditingController: TextEditingController(text: user.email),
    ));
  }
}
