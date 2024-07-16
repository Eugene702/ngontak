import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngontak/app/database/database.dart';
import 'package:ngontak/app/routes/app_pages.dart';
import 'package:ngontak/app/database/schema.dart' as schema;

class HomeController extends GetxController with WidgetsBindingObserver {
  final Database _db = Database();
  RxBool isLoading = false.obs;
  final RxInt count = 50.obs;
  RxList<schema.Contact> contacts = <schema.Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onReady() {
    super.onReady();
    if (FirebaseAuth.instance.currentUser == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      getData();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    state = state;
    print(state);
    print(":::::::");
  }

  Future<void> getData() async {
    isLoading.value = true;
    await _db.initialize();
    final result = _db.realm
        .query<schema.Contact>(
            "user._id == '${FirebaseAuth.instance.currentUser?.uid}'")
        .toList();
    contacts.value = result;
    isLoading.value = false;
  }
}
