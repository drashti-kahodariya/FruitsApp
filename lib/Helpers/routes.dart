import 'package:fruits/Screens/cart_screen.dart';
import 'package:fruits/Screens/detail_screen.dart';
import 'package:fruits/Screens/first_screen.dart';
import 'package:fruits/Screens/home_screen.dart';
import 'package:fruits/Screens/login_screen.dart';
import 'package:fruits/Screens/signup_screen.dart';
import 'package:fruits/Screens/splash_screen.dart';
import 'package:get/get.dart';

import '../main.dart';

///
/// Routes string initialization
///
class Routes {
  static const SPLASH_SCREEN = '/splash_screen';
  static const FIRST_SCREEN = '/first_screen';
  static const LOGIN_SCREEN = '/login_screen';
  static const SIGNUP_SCREEN = '/signin_screen';
  static const HOME_SCREEN = '/home_screen';
  static const DETAIL_SCREEN = '/detail_screen';
  static const CART_SCREEN = '/cart_screen';
}

///
/// Connect the UI Screen class with route screen with help of GetPage,
///
/// Call `Get.toNamed(Routes.SPLASH_SCREEN)` for navigation from anywhere
///
class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
        name: Routes.SPLASH_SCREEN,
        page: () => SplashScreen(),
        // binding: CounterBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.FIRST_SCREEN,
        page: () => FirstScreen(),
        // binding: CounterBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.LOGIN_SCREEN,
        page: () => LoginScreen(),
        // binding: CounterBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.SIGNUP_SCREEN,
        page: () => SignupScreen(),
        // binding: CounterBinding(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.HOME_SCREEN,
        page: () => HomeScreen(),
        // binding: CounterBinding(),
        transition: Transition.cupertino),
    GetPage(
      name: Routes.DETAIL_SCREEN,
      page: () => DetailScreen(),
      // binding: CounterBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.CART_SCREEN,
      page: () => CartScreen(),
      // binding: CounterBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
