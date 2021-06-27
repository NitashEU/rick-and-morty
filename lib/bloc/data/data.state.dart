import 'package:rick_and_morty/bloc/data/data-state-type.enum.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/location-extended.model.dart';

class DataState {
  const DataState({
    this.type,
    this.characters,
    this.locations,
  });

  final DataStateType type;
  final List<Character> characters;
  final List<LocationExtended> locations;

  DataState copyWith({
    DataStateType type,
    List<Character> characters,
    List<LocationExtended> locations,
  }) {
    return DataState(
      type: type ?? this.type,
      characters: characters ?? this.characters,
      locations: locations ?? this.locations,
    );
  }
}
