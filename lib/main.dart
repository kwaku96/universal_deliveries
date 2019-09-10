import 'package:flutter/material.dart';
import 'package:kingsly_jamal/pages/LandingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Deliveries',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
