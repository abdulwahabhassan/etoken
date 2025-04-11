import 'package:etoken/data/repositories/user_repository.dart';
import 'package:etoken/data/service/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod

// ignore: avoid_manual_providers_as_generated_provider_dependency
UserRepository userRepository(Ref ref) => UserRepository(ref.watch(eTokenApiServiceProvider));