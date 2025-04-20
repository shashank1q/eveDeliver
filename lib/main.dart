import 'package:evedelivery/routes.dart';
import 'package:flutter/material.dart';
// Use package:flutter_web_plugins to set the URL strategy for your app.
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // Turn off the # in the URLs on the web.
  usePathUrlStrategy();
  runApp(const MyApp()); // Added const
}


class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Ensure const is here if needed, already present

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'OTP App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
