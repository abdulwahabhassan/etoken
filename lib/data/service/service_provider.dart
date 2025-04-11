import 'package:etoken/data/service/network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_provider.g.dart';

@riverpod
ETokenApiService eTokenApiService(Ref ref) => ETokenApiService();