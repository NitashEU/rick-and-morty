import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_and_morty/models/gender.enum.dart';
import 'package:rick_and_morty/models/status.enum.dart';

class IconUtility {
  static IconData genderToIcon(CharacterGender gender) {
    switch (gender) {
      case CharacterGender.FEMALE:
        return FontAwesomeIcons.venus;
      case CharacterGender.MALE:
        return FontAwesomeIcons.mars;
      case CharacterGender.GENDERLESS:
        return FontAwesomeIcons.genderless;
      default:
        return FontAwesomeIcons.transgender;
    }
  }

  static IconData statusToIcon(CharacterStatus status) {
    switch (status) {
      case CharacterStatus.ALIVE:
        return FontAwesomeIcons.solidFlushed;
      case CharacterStatus.DEAD:
        return FontAwesomeIcons.solidDizzy;
      default:
        return FontAwesomeIcons.solidMehBlank;
    }
  }
}
