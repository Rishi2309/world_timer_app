import 'package:flutter/material.dart';
import 'package:world_timer_app/pages/home.dart';
import 'package:world_timer_app/pages/loading.dart';
import 'package:world_timer_app/pages/choose_location.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => chooseLocation(),

  },
));

