import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final String flavorName;
  final String baseUrl;
  final bool isProduction;

  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.baseUrl,
    @required this.isProduction,
    @required Widget child,
  }) : super(child: child) {
    print('AppConfig Construct');
    assert(appName != null);
    assert(flavorName != null);
    assert(baseUrl != null);
    assert(isProduction != null);
  }

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
