import 'package:evedelivery/routes.dart';
import 'package:flutter/material.dart';

void main() {
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
