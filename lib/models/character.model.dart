import 'package:rick_and_morty/models/gender.enum.dart';
import 'package:rick_and_morty/models/location.model.dart';
import 'package:rick_and_morty/models/status.enum.dart';
import 'package:rick_and_morty/utility/enum.utility.dart';

class Character {
  int id;
  String name;
  CharacterStatus status;
  String species;
  String type;
  CharacterGender gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = EnumUtility.statusFromJson(json['status']);
    species = json['species'];
    type = json['type'];
    gender = EnumUtility.genderFromJson(json['gender']);
    origin = json['origin'] != null ? new Location.fromJson(json['origin']) : null;
    location = json['location'] != null ? new Location.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>().toList();
    url = json['url'];
    created = DateTime.parse(json['created']);
  }
}
