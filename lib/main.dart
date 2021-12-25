import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:test/HomePage.dart';

//import 'package:flutter/pages/home_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fdsf ref',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          caption: TextStyle(fontSize: 22.0, color: Colors.blue),
        ),
        fontFamily: 'Georgia',
      ),
      home: ListWidgetHomePage(),
    );
  }
}
