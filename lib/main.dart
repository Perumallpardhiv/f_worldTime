import 'package:f_worldtime2/pages/choose_location.dart';
import 'package:f_worldtime2/pages/home.dart';
import 'package:f_worldtime2/pages/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),     // This line and line10 will conflicts and gives error so we removed
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
