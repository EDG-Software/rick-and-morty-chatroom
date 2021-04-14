import 'package:flutter/material.dart';
import 'package:rick_and_morty_chatroom/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty Chatroom',
      home: MainScreen(),
    );
  }
}
