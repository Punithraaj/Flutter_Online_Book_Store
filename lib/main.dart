import 'package:flutter/material.dart';
import 'package:flutter_online_book_store/screen/MainScreen.dart';
import 'package:flutter_online_book_store/utils/utility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.light, primaryColor: primary),
      home: MainScreen(),
    );
  }
}
