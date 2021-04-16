import 'package:flutter/material.dart';
import 'package:rick_and_morty_chatroom/models/location.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  Location location;
  ChatScreen(Location location) {
    this.location = location;
  }

  @override
  State<StatefulWidget> createState() {
    return ChatScreenState(location);
  }
}

class ChatScreenState extends State {
  Location location;
  ChatScreenState(Location location) {
    this.location = location;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Center(
        child: Text('Chat with people in the ' + location.name),
      ),
    );
  }
}
