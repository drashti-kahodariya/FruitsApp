import 'package:flutter/material.dart';
import 'package:fruits/Controller/cart_screen_controller.dart';
import 'package:fruits/Controller/detail_screen_controller.dart';
import 'package:fruits/Helpers/constant.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartScreenController = Get.put(CartScreenController());
  final detailScreenController = Get.put(DetailScreenController());

  @override
  void initState() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => cartScreenController.getCartItem());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff4f4f3),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          color: lightGrey,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 27.w,
                    ),
                    Text(
                      "My cart",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Obx(
                () => cartScreenController.cartItem.isEmpty
                    ? Container(
                        child: Column(
                          children: [
                            Container(
                              height: 10.h,
                              child: Image.asset(
                                  "assets/images/shopping-cart.png"),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Text(
                              "Your cart is empty!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: black),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HOME_SCREEN);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                  height: 5.h,
                                  width: 60.w,
                                  color: orange,
                                  child: Center(
                                    child: Text(
                                      "Start Shopping",
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
                          ],
                        ),
                      )
                    : Expanded(
                      child: Column(
                          children: [
                            Obx(() => ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: cartScreenController.cartItem.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    height: 1.h,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Dismissible(
                                      background: Container(
                                        color: Color(0xffedb890),
                                        child: Icon(
                                          Icons.delete,
                                          size: 40,
                                        ),
                                      ),
                                      key: ValueKey(
                                          cartScreenController.cartItem[index]),
                                      confirmDismiss:
                                          (DismissDirection direction) async {
                                        cartScreenController.deleteItem(
                                            cartData: cartScreenController
                                                .cartItem[index]);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: 12.h,
                                          color: white,
                                          child: Row(
                                            children: [
                                              Container(
                                                  height: 10.h,
                                                  width: 25.w,
                                                  child: Image.asset(
                                                    "assets/images/${cartScreenController.cartItem[index].image}",
                                                  )),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${cartScreenController.cartItem[index].fruitName}",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: black),
                                                    ),
                                                    Text(
                                                      " Red Strawberry",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: grey),
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            detailScreenController
                                                                .decrement(
                                                                    fruitId: cartScreenController
                                                                        .cartItem[
                                                                            index]
                                                                        .id);
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                            child: Container(
                                                              height: 3.h,
                                                              width: 6.w,
                                                              color: lightGrey,
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  color: black,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Text(
                                                          "${cartScreenController.cartItem[index].qty}",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color: black),
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            detailScreenController
                                                                .increment(
                                                                    fruitId: cartScreenController
                                                                        .cartItem[
                                                                            index]
                                                                        .id);
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                            child: Container(
                                                              height: 3.h,
                                                              width: 6.w,
                                                              color: orange,
                                                              child: Icon(
                                                                Icons.add,
                                                                color: white,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                // width: 5.w,
                                                width: 20.w,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "\$${cartScreenController.cartItem[index].price} /kg",
                                                      // detailScreenController.count.toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )),
                            Spacer(),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                Obx(
                                  () => Text(
                                    "\$${cartScreenController.subtotal}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Fee",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                Text(
                                  "\$100",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: black),
                                ),
                                Obx(
                                  () => Text(
                                    "\$${cartScreenController.total}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                cartScreenController.checkout();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                  height: 5.h,
                                  width: 60.w,
                                  color: orange,
                                  child: Center(
                                    child: Text(
                                      "Checkout",
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
                          ],
                        ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
