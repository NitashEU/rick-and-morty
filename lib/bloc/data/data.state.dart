import 'package:rick_and_morty/bloc/data/data-state-type.enum.dart';

class DataState {
  const DataState({
    this.type,
  });

  final DataStateType type;

  DataState copyWith({
    DataStateType type,
  }) {
    return DataState(
      type: type ?? this.type,
    );
  }
}
