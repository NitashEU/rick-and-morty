import 'package:flutter/material.dart';
import 'package:rick_and_morty/bloc/enums.cubit.dart';
import 'package:rick_and_morty/models/gender.enum.dart';
import 'package:rick_and_morty/models/status.enum.dart';
import 'package:rick_and_morty/screens/enum-input.widget.dart';

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

  static Widget enumInputLabeled<T, TBloc extends EnumsCubit<TState>, TState>({
    String label,
    List<T> values,
    String id,
    String name,
    bool multi = false,
    Map<T, String> textMap,
    Map<T, IconData> iconMap,
    Map<T, int> iconSizeMap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: label,
              ),
              ...(!multi
                  ? []
                  : [
                      TextSpan(
                        text: ' (Multiselection possible)',
                      ),
                    ])
            ],
          ),
        ),
        SizedBox(height: 6),
        EnumInput<T, TBloc, TState>(
          values: values,
          id: id,
          name: name,
          multi: multi,
          textMap: textMap,
          iconMap: iconMap,
          iconSizeMap: iconSizeMap,
        ),
      ],
    );
  }
}
