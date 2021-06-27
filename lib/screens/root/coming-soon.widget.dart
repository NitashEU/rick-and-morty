import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget(this.showBackButton);

  final bool showBackButton;

  @override
  _ComingSoonWidget createState() => _ComingSoonWidget();
}

class _ComingSoonWidget extends State<ComingSoonWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 128, 32, 32),
        child: Column(
          children: [
            Lottie.asset('assets/lottie/error.json'),
            SizedBox(height: 32),
            Text('Not yet implemented...'),
            ...(!widget.showBackButton
                ? []
                : [
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Text('Zurück'),
                    ),
                  ]),
          ],
        ),
      ),
    );
  }
}
