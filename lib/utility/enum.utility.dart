import 'package:rick_and_morty/models/gender.enum.dart';
import 'package:rick_and_morty/models/status.enum.dart';

class EnumUtility {
  static CharacterGender genderFromJson(String json) {
    switch (json) {
      case 'Female':
        return CharacterGender.FEMALE;
      case 'Male':
        return CharacterGender.MALE;
      case 'Genderless':
        return CharacterGender.GENDERLESS;
      default:
        return CharacterGender.UNKNOWN;
    }
  }

  static CharacterStatus statusFromJson(String json) {
    switch (json) {
      case 'Alive':
        return CharacterStatus.ALIVE;
      case 'Dead':
        return CharacterStatus.DEAD;
      default:
        return CharacterStatus.UNKNOWN;
    }
  }
}
