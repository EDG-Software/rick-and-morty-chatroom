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
      appBar: AppBar(title: Text(location.name + " Chat Room")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome to the Chat Screen, " + character.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("This is " + location.name),
              )
            ],
          ),
        ),
      ),
    );
  }
}
