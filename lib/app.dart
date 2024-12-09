
import 'package:flutter/material.dart';
import 'package:listview_class/view/card_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardView(), // Set SignUpView as the home screen
    );
  }
}