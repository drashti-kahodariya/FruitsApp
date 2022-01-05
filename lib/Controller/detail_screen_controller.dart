import 'package:fruits/Helpers/routes.dart';
import 'package:fruits/Models/cart_model.dart';
import 'package:fruits/Models/fruit_model.dart';
import 'package:fruits/Models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreenController extends GetxController {
  var count = 1.obs;
  var userId = UserModel.fromJson(GetStorage().read('user')).uid;

  void increment({String? fruitId}) {
    count++;
    updateCartItem(fruitId);
  }

  void decrement({String? fruitId}) {
    if (count.value != 1) {
      count--;
      updateCartItem(fruitId);
    }
  }

  Future<void> addtoCart(Fruits argumentData) async {
    var cartData = CartModel.fromJson(argumentData.toJson());
    cartData.qty=count.value.toString();

    await FirebaseFirestore.instance
        .collection("FruitAppUser")
        .doc(userId)
        .collection("Cart")
        .doc(argumentData.id)
        .set(cartData.toJson());
    Get.toNamed(Routes.CART_SCREEN);
  }

  Future<void> updateCartItem(String? fruitId) async {
    await FirebaseFirestore.instance
        .collection("FruitAppUser")
        .doc(userId)
        .collection("Cart")
        .doc(fruitId)
        .update({
      "qty": count.value.toString(),
    });
  }
}
