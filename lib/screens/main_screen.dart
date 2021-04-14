import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_chatroom/data/api/character_api.dart';
import 'package:rick_and_morty_chatroom/models/character.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Character> characters = <Character>[];

  @override
  void initState() {
    getCharactersFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick And Morty Chatroom')),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return Text(characters[index].name);
            },
          )),
    );
  }

  void getCharactersFromApi() {
    CharacterApi.getCharacters().then((response) {
      setState(() {
        List<dynamic> list = json.decode(response.body)["results"];
        this.characters =
            list.map((character) => Character.fromJson(character)).toList();
      });
    });
  }
}
