import 'package:rick_and_morty/models/location.model.dart';

class LocationExtended extends Location {
  int id;
  String type;
  String dimension;
  List<String> residents;
  DateTime created;

  LocationExtended({
    this.id,
    this.type,
    this.dimension,
    this.residents,
    this.created,
  });

  LocationExtended.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = json['residents'].cast<String>().toList();
    url = json['url'];
    created = DateTime.parse(json['created']);
  }
}
