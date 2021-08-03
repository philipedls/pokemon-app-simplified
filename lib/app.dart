import 'package:flutter/material.dart';
import 'package:pokemon_app/presentation/pages/detail/detail_page.dart';
import 'package:pokemon_app/presentation/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/detail': (BuildContext context) => DetailPage(),
      },
    );
  }
}
