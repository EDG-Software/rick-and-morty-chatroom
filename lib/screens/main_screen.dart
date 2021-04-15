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
  Widget build(BuildContext context)  {
    return Scaffold(
        appBar: AppBar(title: Text('Rick And Morty Chatroom')),
        body:
        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: characters.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 150,
                  color: Colors.cyan,
                  child: Center(child:
                  Text(characters[index].name),
                  )

              );
            }
        )
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
