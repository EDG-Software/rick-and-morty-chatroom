import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    Uri url = new Uri.http("rickandmortyapi.com", "/api/character");
    return http.get(url);
  }
}
