class Character {
  int id;
  String name;
  String status;
  String gender;
  String location;
  String image;

  Character(this.name, this.status, this.gender, this.location, this.image);

  Character.fromJson(Map json) {
    name = json['name'];
    status = json['status'];
    gender = json['gender'];
    location = json['location']['name'];
    image = json['image'];
  }

  Map toJson() {
    return {
      'name': name,
      'status': status,
      'gender': gender,
      'location': location,
      'image': image
    };
  }
}
