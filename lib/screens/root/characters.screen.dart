import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/data/data.cubit.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/screens/root/character-detail.screen.dart';
import 'package:rick_and_morty/utility/icon.utility.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) => SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              children: state.characters.map((c) => buildCharacterTile(c)).toList(),
            ),
          ),
        ),
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
