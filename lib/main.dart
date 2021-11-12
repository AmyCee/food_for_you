import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_for_you/provider/food_provider.dart';
import 'package:food_for_you/screen/login.dart';
import 'package:food_for_you/utils/hex_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor('E1AD01'),

        primarySwatch: mainSwatch,
      ),
      home: Login()
    );
  }
}