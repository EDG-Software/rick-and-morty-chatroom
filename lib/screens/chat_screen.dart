import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_chatroom/data/api/character_api.dart';
import 'package:rick_and_morty_chatroom/models/character.dart';
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

  List<Character> characters = <Character>[];

  @override
  void initState() {
    getCharacterByLocation(location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              location.name + ' (' + characters.length.toString() + ' users)'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                'Users in ' + location.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30.0,
              ),
              new Expanded(
                child: ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(characters[index].name);
                    }),
              ),
            ],
          ),
        ));
  }

  void getCharacterByLocation(Location location) {
    if (location.residents.length == 0) return null;
    List characterIds = location.residents
        .map((el) =>
            el.toString().split('/')[el.toString().split('/').length - 1])
        .toList();
    CharacterApi.getCharactersByIds(characterIds).then((response) {
      setState(() {
        List<dynamic> list = json.decode(response.body);
        this.characters = list
            .map((character) => Character.fromJson(character))
            .where((element) => element.location == this.location.name)
            .toList();
      });
    });
  }
}
