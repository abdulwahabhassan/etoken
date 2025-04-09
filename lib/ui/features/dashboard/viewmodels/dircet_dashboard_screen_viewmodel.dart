import 'package:flutter/foundation.dart';

import '../../../../data/repositories/user_repository.dart';
import '../../../../domain/models/user.dart';

class DirectDashboardScreenViewModel extends ChangeNotifier {
  DirectDashboardScreenViewModel({required UserRepository userRepository})
    : _userRepository = userRepository {
    _loadUser();
  }

  final UserRepository _userRepository;

  User? _user;

  User? get user => _user;

  Future<void> _loadUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }
}
