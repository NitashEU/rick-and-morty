import 'package:get/get.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/location-extended.model.dart';
import 'package:rick_and_morty/models/paginated-result.model.dart';

class DataRepository {
  final _characterBaseUrl = 'https://rickandmortyapi.com/api/character';
  final _locationBaseUrl = 'https://rickandmortyapi.com/api/location';

  Future<List<Character>> getAllCharacters() async {
    PaginatedResult<Character> paginatedResult;
    final characters = <Character>[];
    do {
      paginatedResult = (await GetConnect().get<PaginatedResult<Character>>(
        paginatedResult == null ? _characterBaseUrl : paginatedResult.info.next,
        decoder: (pr) => PaginatedResult.fromJson(pr, (c) => Character.fromJson(c)),
      ))
          .body;
      characters.addAll(paginatedResult.results);
    } while (paginatedResult.info.next != null);
    return characters;
  }

  Future<List<LocationExtended>> getAllLocations() async {
    PaginatedResult<LocationExtended> paginatedResult;
    final locations = <LocationExtended>[];
    do {
      paginatedResult = (await GetConnect().get<PaginatedResult<LocationExtended>>(
        paginatedResult == null ? _locationBaseUrl : paginatedResult.info.next,
        decoder: (pr) => PaginatedResult.fromJson(pr, (c) => LocationExtended.fromJson(c)),
      ))
          .body;
      locations.addAll(paginatedResult.results);
    } while (paginatedResult.info.next != null);
    return locations;
  }
}
