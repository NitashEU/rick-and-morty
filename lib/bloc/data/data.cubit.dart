import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataState());

  void init() {}
}
