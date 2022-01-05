import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fruits/Controller/cart_screen_controller.dart';
import 'package:fruits/Controller/detail_screen_controller.dart';
import 'package:fruits/Helpers/constant.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:fruits/Models/fruit_model.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Fruits argumentData = Get.arguments;
  final detailScreenController = Get.put(DetailScreenController());
  final cartScreenController = Get.put(CartScreenController());
  @override
  void initState() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => cartScreenController.getCartItem());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff4f4f3),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.CART_SCREEN);
                  },
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff4f4f3),
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => Text(
                            "${cartScreenController.cartItem.length}",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                        Icon(
                          Icons.add_shopping_cart,
                          color: black,
                          size: 3.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              height: 45.h,
              child: Image.asset(
                "assets/images/${argumentData.image}",
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0)),
                color: orange,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Red Coration",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        Text(
                          "\$${argumentData.price} /kg",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: white),
                        ),
                      ],
                    ),
                    Text(
                      "${argumentData.fruitName}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 18,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "${argumentData.star}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: white),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "(Reviews 126)",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // cartScreenController.cartItem.contains(argumentData.id)== false ? Container() :
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Quality:",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: black),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            detailScreenController.decrement(
                                fruitId: argumentData.id);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 3.h,
                              width: 6.w,
                              color: white,
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Obx(
                          () => Text(
                            "${detailScreenController.count}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            detailScreenController.increment(
                                fruitId: argumentData.id);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 3.h,
                              width: 6.w,
                              color: Colors.black54,
                              child: Icon(
                                Icons.add,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here'",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: white),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              height: 5.h,
                              width: 15.w,
                              color: Colors.black26,
                              child: Center(
                                  child: Icon(
                                Icons.favorite,
                                color: white,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            detailScreenController.addtoCart(argumentData);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Container(
                              height: 5.h,
                              width: 70.w,
                              color: Colors.black26,
                              child: Center(
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class SampleSacreen extends GetView<HomeScreenController>{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(child: Text(controller.fruitData.length.toString()),);
//   }
//
// }
