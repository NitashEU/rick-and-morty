import 'package:rick_and_morty/bloc/character-filter/character-filter.state.dart';
import 'package:rick_and_morty/bloc/enums.cubit.dart';
import 'package:rick_and_morty/models/gender.enum.dart';
import 'package:rick_and_morty/models/status.enum.dart';

class CharacterFilterCubit extends EnumsCubit<CharacterFilterState> {
  CharacterFilterCubit()
      : super(
          CharacterFilterState(
            genders: [
              CharacterGender.FEMALE,
              CharacterGender.MALE,
              CharacterGender.GENDERLESS,
              CharacterGender.UNKNOWN,
            ],
            stati: [
              CharacterStatus.ALIVE,
              CharacterStatus.DEAD,
              CharacterStatus.UNKNOWN,
            ],
          ),
        );

  @override
  bool enumMatches<T>(T value, String enumName) {
    switch (enumName) {
      case 'Gender':
        return state.genders.contains(value);
      case 'Status':
        return state.stati.contains(value);
      default:
        return false;
    }
  }

  @override
  void enumChanged<T>(T value, String enumName) {
    switch (enumName) {
      case 'Gender':
        genderChanged(value as CharacterGender);
        break;
      case 'Status':
        statusChanged(value as CharacterStatus);
        break;
    }
  }

  void genderChanged(CharacterGender value) {
    final genders = List<CharacterGender>.from(state.genders);
    if (genders.contains(value)) {
      genders.remove(value);
    } else {
      genders.add(value);
    }
    emit(
      CharacterFilterState(
        genders: genders,
        stati: state.stati,
      ),
    );
  }

  void statusChanged(CharacterStatus value) {
    final stati = List<CharacterStatus>.from(state.stati);
    if (stati.contains(value)) {
      stati.remove(value);
    } else {
      stati.add(value);
    }
    emit(
      CharacterFilterState(
        genders: state.genders,
        stati: stati,
      ),
    );
  }
}
