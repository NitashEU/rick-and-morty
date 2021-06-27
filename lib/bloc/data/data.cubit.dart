import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/data/data-state-type.enum.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';
import 'package:rick_and_morty/repositories/data.repository.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.repository)
      : super(DataState(
          loadingQuote: '"Thanks, Mr. Poopybutthole. I always could count on you." — Rick',
        ));

  final DataRepository repository;

  void init() async {
    final quotes = await repository.getQuotes();
    emit(state.copyWith(
      quotes: quotes,
    ));
    final characters = await repository.getAllCharacters();
    emit(state.copyWith(
      characters: characters,
      loadingQuote: (state.quotes.toList()..shuffle()).firstWhere((q) => q != state.loadingQuote),
    ));
    final locations = await repository.getAllLocations();
    emit(state.copyWith(
      locations: locations,
      loadingQuote: (state.quotes.toList()..shuffle()).firstWhere((q) => q != state.loadingQuote),
    ));
    final episodes = await repository.getAllEpisodes();
    emit(state.copyWith(
      episodes: episodes,
      loadingQuote: '',
      type: DataStateType.LOADED,
    ));
  }
}
