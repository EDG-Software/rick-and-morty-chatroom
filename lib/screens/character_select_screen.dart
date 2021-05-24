import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_chatroom/data/api/character_api.dart';
import 'package:rick_and_morty_chatroom/models/character.dart';
import 'package:rick_and_morty_chatroom/models/location.dart';
import 'package:rick_and_morty_chatroom/screens/chat_screen.dart';

// ignore: must_be_immutable
class CharacterSelectScreen extends StatefulWidget {
  Location location;
  CharacterSelectScreen(Location location) {
    this.location = location;
  }

  @override
  State<StatefulWidget> createState() {
    return CharacterSelectScreenState(location);
  }
}

class CharacterSelectScreenState extends State {
  Location location;
  CharacterSelectScreenState(Location location) {
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
                    return new GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(characters[index], location)))
                      },
                      child: Container(
                          child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              characters[index].image,
                              width: 100,
                            ),
                          ),
                          Text(
                            characters[index].name,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                    );
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
