import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty/bloc/data/data.cubit.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(builder: (context, state) {
      var loadingText = '';
      if ((state.characters ?? []).length == 0) {
        loadingText = 'Loading characters...';
      } else if ((state.locations ?? []).length == 0) {
        loadingText = 'Loading locations...';
      } else if ((state.episodes ?? []).length == 0) {
        loadingText = 'Loading episodes...';
      } else {
        loadingText = 'Let\'s go!';
      }
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 128, 32, 32),
          child: Column(
            children: [
              Lottie.asset('assets/lottie/loading.json'),
              SizedBox(height: 32),
              Text(loadingText),
              SizedBox(height: 32),
              Text(state.loadingQuote),
            ],
          ),
        ),
      );
    });
  }
}
