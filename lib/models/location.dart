class Location {
  int id;
  String name;
  String type;
  List residents;

  Location(this.name, this.type, this.residents);

  Location.fromJson(Map json) {
    name = json['name'];
    type = json['type'];
    residents = json['residents'];
  }

  Map toJson() {
    return {
      'name': name,
      'type': type,
      'residents': residents,
    };
  }
}
