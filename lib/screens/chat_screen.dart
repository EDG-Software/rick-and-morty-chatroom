import 'package:flutter/material.dart';
import 'package:rick_and_morty_chatroom/models/character.dart';
import 'package:rick_and_morty_chatroom/models/location.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  Character character;
  Location location;

  ChatScreen(Character character, Location location) {
    this.character = character;
    this.location = location;
  }

  @override
  State<StatefulWidget> createState() {
    return ChatScreenState(character, location);
  }
}

class ChatScreenState extends State {
  Character character;
  Location location;

  ChatScreenState(Character character, Location location) {
    this.character = character;
    this.location = location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick And Morty Chatroom')),
      body: Container(
        child: Column(
          children: [
            Text("Chat Ekranına hoşgeldiniz,"),
            Text(character.name),
            Text("Burası " + location.name)
          ],
        ),
      ),
    );
  }
}
