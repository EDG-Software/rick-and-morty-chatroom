import 'package:http/http.dart' as http;

class LocationApi {
  static Future getLocations() {
    Uri url = new Uri.https("rickandmortyapi.com", "/api/location");
    return http.get(url);
  }
}
