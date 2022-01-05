import 'package:flutter/material.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:fruits/Screens/first_screen.dart';
import 'package:fruits/Screens/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        title: 'Fruit App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
      );
    });
  }
}
