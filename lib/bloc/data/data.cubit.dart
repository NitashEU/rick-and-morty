import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';
import 'package:rick_and_morty/repositories/data.repository.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.repository) : super(DataState());

  final DataRepository repository;

  void init() async {
    final characters = await repository.getAllCharacters();
    final locations = await repository.getAllLocations();
    emit(state.copyWith(
      characters: characters,
      locations: locations,
    ));
  }
}
