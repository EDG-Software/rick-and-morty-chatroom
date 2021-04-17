import 'dart:convert';

import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    Uri url = new Uri.https("rickandmortyapi.com", "/api/character");
    return http.get(url);
  }

  static Future getCharactersByIds(List characterIds) {
    String parameter =
        '/api/character/' + jsonEncode(characterIds).replaceAll('"', "");
    Uri url = new Uri.https("rickandmortyapi.com", parameter);
    return http.get(url);
  }
}
