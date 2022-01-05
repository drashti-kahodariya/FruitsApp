import 'package:fruits/Helpers/routes.dart';
import 'package:fruits/Models/fruit_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenController extends GetxController {
  var fruitData = <Fruits>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFruitList();
  }

  void getFruitList() async {
    var popularFruitsFirebase =
        await FirebaseFirestore.instance.collection('PopularFruits').get();
    popularFruitsFirebase.docs
        .map((e) => fruitData.add(Fruits.fromJson(e.data())))
        .toList();
  }

  void logout() {
    GetStorage().erase();
    Get.toNamed(Routes.FIRST_SCREEN);
  }
}
