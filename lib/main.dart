import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hc/AppConfig.dart';

import 'views/Splash.dart';

void main() {
  var prodEnv = new AppConfig(
    appName: 'Home Credit',
    flavorName: 'prod',
    baseUrl: 'https://private-a8e48-hcidtest.apiary-mock.com/',
    isProduction: true,
    child: new MyApp(),
  );

  var devEnv = new AppConfig(
    appName: 'Home Credit (Dev)',
    flavorName: 'dev',
    baseUrl: 'https://private-a8e48-hcidtest.apiary-mock.com/',
    isProduction: false,
    child: new MyApp(),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(prodEnv);
  });
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
        cursorColor: Colors.white,
        canvasColor: Colors.transparent,
        hintColor: Colors.grey,
        unselectedWidgetColor: Colors.grey,
        fontFamily: 'avenir',
      ),
      home: new Splash(),
    );
  }
}
