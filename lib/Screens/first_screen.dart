import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Helpers/constant.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("assets/images/strawberry_splash.jpeg"),
          Container(
            height: 45.h,
            width: 90.w,
            color: white,
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 38, right: 28),
                  child: Text(
                    "Choose From Our Best Fruits",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 32, left: 30),
                  child: Text(
                    "Choose anything from daily essentabies to fruit store by home delivery",
                    style: TextStyle(
                      fontSize: 13,
                      color: grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.LOGIN_SCREEN);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 5.h,
                      width: 60.w,
                      color: orange,
                      child: Center(
                        child: Text(
                          "Let's Go",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
