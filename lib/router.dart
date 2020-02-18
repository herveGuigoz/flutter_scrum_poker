import 'package:flutter/material.dart';
import 'package:scrum_poker/ui/pages/home/home_page.dart';
import 'package:scrum_poker/ui/pages/scrum/selected_card.dart';
import 'package:scrum_poker/ui/pages/settings.dart';

import 'ui/common/animations/no_routes.dart';

NoTransitionRoute _pageNotFound(RouteSettings settings) {
  return NoTransitionRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    ),
  );
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/selected':
        return MaterialPageRoute(
          builder: (_) => SelectedCard(number: settings.arguments),
          settings: settings,
        );
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return _pageNotFound(settings);
    }
  }
}
