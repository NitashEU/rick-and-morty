import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/bloc/data/data.cubit.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';
import 'package:rick_and_morty/models/character.model.dart';

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
      builder: (context, state) => SizedBox.expand(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  imageUrl: widget.character.image,
                  fit: BoxFit.fitHeight,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
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
          ],
        ),
      ),
    );
  }
}
