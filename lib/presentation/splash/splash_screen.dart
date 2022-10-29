import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplachController> {
  SplashScreen({super.key});

  final splashcontroller = Get.find<SplachController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.close_rounded,
              color: Colors.amber,
              size: 50,
            ),
            Text(
              "MVVM GETX",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption!,
            ),
          ],
        ),
      ),
    );
  }
}
