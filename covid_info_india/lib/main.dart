import 'package:covid_info_india/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vaccine Details India",
      theme: ThemeData(
          primaryColor: Color.fromRGBO(87, 80, 205, 1),
          dividerTheme: DividerThemeData(
            thickness: 2,
            color: Colors.purple,
          )),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
