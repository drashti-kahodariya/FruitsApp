import 'package:fruits/Helpers/constant.dart';
import 'package:fruits/Models/cart_model.dart';
import 'package:fruits/Models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartScreenController extends GetxController {
  var cartItem = <CartModel>[].obs;
  var subtotal = 0.obs;
  var total = 0.obs;
  var userId = UserModel.fromJson(GetStorage().read('user')).uid;

  @override
  Future<void> onInit() async {
    super.onInit();

    // await getCartItem();
    setSubTotal();
  }

  Future<void> getCartItem() async {cartItem.clear();
    var cartItemFirebase = await FirebaseFirestore.instance
        .collection('FruitAppUser')
        .doc(userId)
        .collection('Cart')
        .get();
    cartItemFirebase.docs
        .map((e) => cartItem.add(CartModel.fromJson(e.data())))
        .toList();
  }

  void deleteItem({required CartModel cartData}) {
    Get.defaultDialog(
      title: "Please confirm!",
      middleText: "Are You sure want to delete?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      barrierDismissible: false,
      cancelTextColor: orange,
      confirmTextColor: white,
      buttonColor: orange,
      onConfirm: () async {
        await FirebaseFirestore.instance
            .collection('FruitAppUser')
            .doc(userId)
            .collection('Cart')
            .doc(cartData.id)
            .delete();
        cartItem.removeWhere((element) => element.id == cartData.id);
        Get.back();
      },
    );
  }

  Future<void> setSubTotal() async {
    await FirebaseFirestore.instance
        .collection('FruitAppUser')
        .doc(userId)
        .collection('Cart')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        subtotal += (int.parse(result.data()['price']) *
            (int.parse(result.data()['qty'])));
      });
    });
    setTotal(subtotal.value);
  }

  void setTotal(int subTotal) {
    total.value = (subTotal + 100).toInt();
  }

  void checkout() {
    try {
      var options = {
        'key': "rzp_test_1DP5mmOlF5G5ag",
        'amount': 100,
        'name': 'Acme Corp.',
        'description': 'Fine T-Shirt',
        'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
      };
      Razorpay().open(options);
    } catch (e) {
      print(e);
    }
  }
}
