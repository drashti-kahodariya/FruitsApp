import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Controller/home_screen_controller.dart';
import 'package:fruits/Helpers/constant.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:fruits/Models/fruit_model.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeScreenController homeScreenController = Get.find();
  final homeScreenController = Get.put(HomeScreenController());

  var fruitList = FruitModel();

  var menuList = ["All", "Strawberry", "Orange", "Kiwi", "Mango", "Apple"];

  @override
  void initState() {
    fruitList.data = [
      Fruits(
        fruitName: "Strawberry",
        image: "strawberry1.png",
        price: "300",
        star: "5",
      ),
      Fruits(
        fruitName: "Mango",
        image: "mango.jpeg",
        price: "600",
        star: "3",
      ),
      Fruits(
        fruitName: "Apple",
        image: "apple1.jpg",
        price: "100",
        star: "4",
      ),
      Fruits(
        fruitName: "Kiwi",
        image: "kiwi.jpg",
        price: "500",
        star: "4",
      ),
      Fruits(
        fruitName: "Orange",
        image: "orange.jpg",
        price: "300",
        star: "5",
      ),
      Fruits(
        fruitName: "pineapple",
        image: "pineapple.jpg",
        price: "100",
        star: "5",
      ),
      Fruits(
        fruitName: "Grape",
        image: "grape.jpg",
        price: "200",
        star: "4",
      ),
    ];
    // uploadFruitList();
  }

  uploadFruitList() async {
    for (var i = 0; i < fruitList.data!.length; i++) {
      fruitList.data![i].id = DateTime.now().microsecondsSinceEpoch.toString();
      await FirebaseFirestore.instance
          .collection('PopularFruits')
          .doc(fruitList.data![i].id)
          .set(fruitList.data![i].toJson());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f3),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0, top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    homeScreenController.logout();
                  },
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGrey,
                    ),
                    child: Icon(
                      Icons.logout,
                      color: black,
                    ),
                  ),
                ),
                Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightGrey,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: black,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, right: 8.0, left: 8.0),
              child: Text(
                "Take your favourite Fruit!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, right: 8.0, left: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    filled: true,
                    hintStyle: TextStyle(color: grey),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search fruit",
                    fillColor: lightGrey),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 4.h,
              // width: 10.w,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: menuList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 4.h,
                      width: 25.w,
                      color: orange,
                      child: Center(
                        child: Text(
                          menuList[index],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 2.w,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Popular",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: Obx(
              () => homeScreenController.fruitData == null
                  ? Center(child: CupertinoActivityIndicator())
                  : GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: homeScreenController.fruitData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_SCREEN,
                                arguments:
                                    homeScreenController.fruitData[index]);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 20.h,
                              width: 35.w,
                              color: white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, right: 18, left: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${homeScreenController.fruitData[index].fruitName}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "\$${homeScreenController.fruitData[index].price} /kg",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Center(
                                      child: Container(
                                          height: 8.h,
                                          child: Image.asset(
                                              "assets/images/${homeScreenController.fruitData[index].image}")),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 4.h,
                                            width: 8.w,
                                            color: orange,
                                            child: Icon(
                                              Icons.add,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )),
          ],
        ),
      ),
    );
  }
}
