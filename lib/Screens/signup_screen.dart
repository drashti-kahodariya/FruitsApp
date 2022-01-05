import 'package:flutter/material.dart';
import 'package:fruits/Controller/signup_screen_controller.dart';
import 'package:fruits/Helpers/constant.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final signupScreenController = Get.put(SignupScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0, top: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: orange,
                    )),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                          color: black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "SignUp",
                  style: TextStyle(
                      color: orange,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextFieldName(
                  icon: Icons.supervisor_account,
                  textFieldName: 'Your Name',
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your Name!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                TextFieldName(
                  icon: Icons.email,
                  textFieldName: 'Your Email',
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (!GetUtils.isEmail(value!)) {
                      return "Please enter valid email!";
                    } else if (value.isEmpty) {
                      return "Please enter Your Email!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                TextFieldName(
                  icon: Icons.lock,
                  textFieldName: 'Your Password',
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your password!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.0.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        signupScreenController.signup(
                            _emailController, _passwordController);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        height: 6.h,
                        // width: 60.w,
                        color: orange,
                        child: Center(
                          child: Text(
                            "SignUp",
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
                  ),
                ),
                SizedBox(
                  height: 6.0.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN_SCREEN);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already user?",
                        style: TextStyle(
                            color: black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "SignIn",
                        style: TextStyle(
                            color: orange,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMedia(
                      image: "assets/images/facebook.png",
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    SocialMedia(
                      image: "assets/images/search.png",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.h,
      width: 3.h,
      child: Image.asset(image),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.icon,
    required this.textFieldName,
  }) : super(key: key);
  final IconData icon;
  final String textFieldName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: orange,
          size: 17.5,
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          textFieldName,
          style: TextStyle(
              color: grey, fontSize: 12.5, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
