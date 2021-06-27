import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/episode.model.dart';
import 'package:rick_and_morty/screens/root/coming-soon.widget.dart';

class EpisodeListWidget extends StatefulWidget {
  const EpisodeListWidget(this.episodes, this.placeholderImageUrl);

  final List<Episode> episodes;
  final String placeholderImageUrl;

  @override
  _EpisodeListWidget createState() => _EpisodeListWidget();
}

class _EpisodeListWidget extends State<EpisodeListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: widget.episodes.map((c) => buildEpisodeTile(c)).toList(),
    );
  }

  Widget buildEpisodeTile(Episode episode) {
    return OpenContainer<bool>(
      openBuilder: (context, _) => ComingSoonWidget(true),
      closedBuilder: (context, _) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  widget.placeholderImageUrl,
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  episode.episode,
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                Text(
                  episode.airDate,
                  style: TextStyle(
                    fontSize: 10,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                      episode.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  /*Row(
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
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
