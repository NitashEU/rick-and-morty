import 'package:rick_and_morty/bloc/data/data-state-type.enum.dart';
import 'package:rick_and_morty/models/character.model.dart';

class DataState {
  const DataState({
    this.type,
    this.characters,
  });

  final DataStateType type;
  final List<Character> characters;

  DataState copyWith({
    DataStateType type,
    List<Character> characters,
  }) {
    return DataState(
      type: type ?? this.type,
      characters: characters ?? this.characters,
    );
  }
}
