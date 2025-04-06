import 'package:flutter/cupertino.dart';

class AppNavigatorObserver extends NavigatorObserver {
  Route? previousRoute;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    this.previousRoute = previousRoute;
    debugPrint("Navigated to ${route.settings.name}, from ${previousRoute?.settings.name}");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    this.previousRoute = previousRoute;
    debugPrint("Popped ${route.settings.name}, returning to ${previousRoute?.settings.name}");
  }

  String? getPreviousRouteName() {
    return previousRoute?.settings.name;
  }
}