import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:rick_and_morty/bloc/data/data-state-type.enum.dart';
import 'package:rick_and_morty/bloc/data/data.cubit.dart';
import 'package:rick_and_morty/bloc/data/data.state.dart';
import 'package:rick_and_morty/screens/error/error.screen.dart';
import 'package:rick_and_morty/screens/root/root.screen.dart';
import 'package:rick_and_morty/screens/splash/splash.screen.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootScreen = RootScreen();
    final splashScreen = SplashScreen();
    final errorScreen = ErrorScreen();

    return GetMaterialApp(
      title: 'Rick and Morty Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/',
          page: () => rootScreen,
        ),
        GetPage(
          name: '/splash',
          page: () => splashScreen,
        ),
        GetPage(
          name: '/error',
          page: () => errorScreen,
        ),
      ],
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        return BlocListener<DataCubit, DataState>(
          listener: (context, state) {
            switch (state.type) {
              case DataStateType.LOADING:
                EasyDebounce.debounce(
                  'debounce-data',
                  Duration(milliseconds: 500),
                  () async => await Get.offAllNamed('/splash'),
                );
                break;
              case DataStateType.LOADED:
                EasyDebounce.debounce(
                  'debounce-data',
                  Duration(milliseconds: 500),
                  () async => await Get.offAllNamed('/'),
                );
                break;
              case DataStateType.ERROR:
                EasyDebounce.debounce(
                  'debounce-data',
                  Duration(milliseconds: 500),
                  () async => await Get.offAllNamed('/error'),
                );
                break;
            }
          },
          child: child,
        );
      },
    );
  }
}
