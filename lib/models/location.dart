class Location {
  int id;
  String name;
  String type;

  Location(this.name, this.type);

  Location.fromJson(Map json) {
    name = json['name'];
    type = json['type'];
  }

  Map toJson() {
    return {
      'name': name,
      'type': type,
    };
  }
}
