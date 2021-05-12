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
          title: Text(location.name +
              ' (' +
              characters.length.toString() +
              ' characters)'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                'Select character from ' + location.name + ' and join chat.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 30.0,
              ),
              new Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: characters.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            characters[index].image,
                            width: 100,
                          ),
                        ),
                        Text(characters[index].name)
                      ],
                    ));
                  },
                ),
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
