import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Rick and Morty Explorer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        getPages: [],
        builder: (context, child) {
          return BlocListener<DataCubit, DataState>(listener: (context, state) {
            switch (state.type) {
              case DataType.LOADING:
                EasyDebounce.debounce(
                  'debounce-data',
                  Duration(milliseconds: 500),
                  () async => await Get.offAllNamed('/splash'),
                );
            }
          });
        });
  }
}
