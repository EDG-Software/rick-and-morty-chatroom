import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_chatroom/data/api/location_api.dart';
import 'package:rick_and_morty_chatroom/models/location.dart';
import 'package:rick_and_morty_chatroom/screens/character_select_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Location> locations = <Location>[];

  @override
  void initState() {
    getLocationsFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Rick And Morty Chatroom')),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.public),
                      title: Text(locations[index].name),
                      subtitle: Text(locations[index].type),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Start Chat'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CharacterSelectScreen(
                                        locations[index])));
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }

  void getLocationsFromApi() {
    LocationApi.getLocations().then((response) {
      setState(() {
        List<dynamic> list = json.decode(response.body)["results"];
        this.locations =
            list.map((location) => Location.fromJson(location)).toList();
      });
    });
  }
}
