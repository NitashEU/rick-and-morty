import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character-filter/character-filter.cubit.dart';
import 'package:rick_and_morty/bloc/character-filter/character-filter.state.dart';
import 'package:rick_and_morty/bloc/data/data.cubit.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/gender.enum.dart';
import 'package:rick_and_morty/models/status.enum.dart';
import 'package:rick_and_morty/screens/root/character-detail.screen.dart';
import 'package:rick_and_morty/utility/enum.utility.dart';
import 'package:rick_and_morty/utility/icon.utility.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) => BlocBuilder<CharacterFilterCubit, CharacterFilterState>(
        builder: (context, filterState) {
          final characters = state.characters.where((c) {
            if (!filterState.genders.contains(c.gender)) {
              return false;
            }
            return filterState.stati.contains(c.status);
          });
          return SafeArea(
            child: SizedBox.expand(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    EnumUtility.enumInputLabeled<CharacterGender, CharacterFilterCubit, CharacterFilterState>(
                      label: 'Gender',
                      values: [CharacterGender.FEMALE, CharacterGender.MALE, CharacterGender.GENDERLESS, CharacterGender.UNKNOWN],
                      id: 'Gender',
                      name: 'Gender',
                      multi: true,
                      iconMap: {
                        CharacterGender.FEMALE: IconUtility.genderToIcon(CharacterGender.FEMALE),
                        CharacterGender.MALE: IconUtility.genderToIcon(CharacterGender.MALE),
                        CharacterGender.GENDERLESS: IconUtility.genderToIcon(CharacterGender.GENDERLESS),
                        CharacterGender.UNKNOWN: IconUtility.genderToIcon(CharacterGender.UNKNOWN),
                      },
                      iconSizeMap: {
                        CharacterGender.FEMALE: 14,
                        CharacterGender.MALE: 14,
                        CharacterGender.GENDERLESS: 14,
                        CharacterGender.UNKNOWN: 14,
                      },
                      textMap: {
                        CharacterGender.FEMALE: 'F',
                        CharacterGender.MALE: 'M',
                        CharacterGender.GENDERLESS: 'G',
                        CharacterGender.UNKNOWN: 'U',
                      },
                    ),
                    SizedBox(height: 8),
                    EnumUtility.enumInputLabeled<CharacterStatus, CharacterFilterCubit, CharacterFilterState>(
                      label: 'Status',
                      values: [CharacterStatus.ALIVE, CharacterStatus.DEAD, CharacterStatus.UNKNOWN],
                      id: 'Status',
                      name: 'Status',
                      multi: true,
                      iconMap: {
                        CharacterStatus.ALIVE: IconUtility.statusToIcon(CharacterStatus.ALIVE),
                        CharacterStatus.DEAD: IconUtility.statusToIcon(CharacterStatus.DEAD),
                        CharacterStatus.UNKNOWN: IconUtility.statusToIcon(CharacterStatus.UNKNOWN),
                      },
                      iconSizeMap: {
                        CharacterStatus.ALIVE: 14,
                        CharacterStatus.DEAD: 14,
                        CharacterStatus.UNKNOWN: 14,
                      },
                      textMap: {
                        CharacterStatus.ALIVE: 'A',
                        CharacterStatus.DEAD: 'D',
                        CharacterStatus.UNKNOWN: 'U',
                      },
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        children: characters.map((c) => buildCharacterTile(c)).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildCharacterTile(Character character) {
    return OpenContainer<bool>(
      openBuilder: (context, _) => CharacterDetailScreen(character: character),
      closedBuilder: (context, _) => Stack(
        children: [
          CachedNetworkImage(
            imageUrl: character.image,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              color: Colors.black.withOpacity(0.8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      character.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        IconUtility.genderToIcon(character.gender),
                        color: Colors.white.withOpacity(0.8),
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Icon(
                        IconUtility.statusToIcon(character.status),
                        color: Colors.white.withOpacity(0.8),
                        size: 16,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
