import 'package:flutter/material.dart';
import 'package:testenviroment/screens/add_card_first.dart';
import 'package:testenviroment/screens/simple_code_screen_one.dart';
import 'package:testenviroment/screens/test_page.dart';
import 'package:testenviroment/widgets/curve_example.dart';
import 'package:testenviroment/widgets/curve_sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AddCardFirstScreen(),
    );
  }
}