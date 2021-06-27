import 'package:bloc/bloc.dart';

abstract class EnumsCubit<TState> extends Cubit<TState> {
  EnumsCubit(TState defaultState) : super(defaultState);

  bool enumMatches<T>(T value, String enumName);
  void enumChanged<T>(T value, String enumName);
}
