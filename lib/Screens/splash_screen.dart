import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:fruits/Screens/first_screen.dart';
import 'package:fruits/Screens/home_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Unknown battery level.';
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  @override
  void initState() {
    Timer(Duration(seconds: 0), () {
      if (GetStorage().read('user') == null) {
        Get.toNamed(Routes.FIRST_SCREEN);
      } else {
        Get.toNamed(Routes.HOME_SCREEN);
      }
    });
    // WidgetsBinding.instance!
    //     .addPostFrameCallback((_) =>  GetStorage().read('user') == null ? Get.toNamed(Routes.FIRST_SCREEN) :Get.toNamed(Routes.HOME_SCREEN));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
