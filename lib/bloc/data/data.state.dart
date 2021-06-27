import 'package:rick_and_morty/bloc/data/data-state-type.enum.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/episode.model.dart';
import 'package:rick_and_morty/models/location-extended.model.dart';

class DataState {
  const DataState({
    this.type,
    this.characters,
    this.locations,
    this.episodes,
  });

  final DataStateType type;
  final List<Character> characters;
  final List<LocationExtended> locations;
  final List<Episode> episodes;

  DataState copyWith({
    DataStateType type,
    List<Character> characters,
    List<LocationExtended> locations,
    List<Episode> episodes,
  }) {
    return DataState(
      type: type ?? this.type,
      characters: characters ?? this.characters,
      locations: locations ?? this.locations,
      episodes: episodes ?? this.episodes,
    );
  }
}
