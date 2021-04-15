import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    Uri url = new Uri.https("rickandmortyapi.com", "/api/character");
    return http.get(url);
  }
}
