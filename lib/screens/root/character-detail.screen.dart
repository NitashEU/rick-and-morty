import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/bloc/data/data.cubit.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/screens/root/episode-list.widget.dart';
import 'package:rick_and_morty/utility/icon.utility.dart';

class CharacterDetailScreen extends StatefulWidget {
  const CharacterDetailScreen({@required this.character}) : assert(character != null);

  final Character character;

  @override
  _CharacterDetailScreen createState() => _CharacterDetailScreen();
}

class _CharacterDetailScreen extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        final episodes = state.episodes.where((e) => widget.character.episode.any((ce) => e.url == ce)).toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  imageUrl: widget.character.image,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.black.withOpacity(0.8),
                    child: Row(
                      children: [
                        Icon(
                          IconUtility.genderToIcon(widget.character.gender),
                          color: Colors.white.withOpacity(0.8),
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Icon(
                          IconUtility.statusToIcon(widget.character.status),
                          color: Colors.white.withOpacity(0.8),
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          widget.character.species,
                          style: TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: -20,
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.red,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.arrowDown),
                      color: Colors.white,
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.character.name),
                  SizedBox(height: 16),
                  Text('Origin: ${widget.character.origin.name}'),
                  SizedBox(height: 8),
                  Text('Last Location: ${widget.character.location.name}'),
                  SizedBox(height: 16),
                  Text('Episodes (${episodes.length}):'),
                  SizedBox(
                    height: 280,
                    child: EpisodeListWidget(
                      episodes,
                      widget.character.image,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
