// responsible for polling data from services, and transforming that raw data into domain models

// Repositories handle the business logic associated with services, such as:
//
// Caching
// Error handling
// Retry logic
// Refreshing data
// Polling services for new data
// Refreshing data based on user.dart actions

// Repositories and view models have a many-to-many relationship.
// A view models can use many repositories to get the data it needs, and a repository can be used by many view models.

import 'dart:async';

import '../../domain/models/user.dart';

class UserRepository {
  Future<User> getUser() => Future.delayed(Duration(seconds: 3), () {
    return User(firstname: "Hassan", lastname: "Abdulwahab");
  });
}
