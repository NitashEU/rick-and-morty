import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/app.view.dart';
import 'package:rick_and_morty/bloc/data/data.cubit.dart';
import 'package:rick_and_morty/repositories/data.repository.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataRepository = DataRepository();

    final dataCubit = DataCubit();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: dataRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: dataCubit),
        ],
        child: AppView(),
      ),
    );
  }
}
