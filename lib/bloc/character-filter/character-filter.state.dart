import 'package:rick_and_morty/models/gender.enum.dart';
import 'package:rick_and_morty/models/status.enum.dart';

class CharacterFilterState {
  const CharacterFilterState({
    this.genders,
    this.stati,
  });

  final List<CharacterGender> genders;
  final List<CharacterStatus> stati;
}
