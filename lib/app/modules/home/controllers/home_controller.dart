import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngontak/app/database/database.dart';
import 'package:ngontak/app/routes/app_pages.dart';
import 'package:ngontak/app/database/schema.dart' as schema;

class HomeController extends GetxController {
  final Database _db = Database();
  RxBool isLoading = false.obs;
  RxList<schema.Contact> contacts = <schema.Contact>[].obs;
  RxList<schema.Contact> searchContacts = <schema.Contact>[].obs;
  SearchController searchController = SearchController();

  @override
  void onReady() {
    super.onReady();
    if (FirebaseAuth.instance.currentUser == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      getData();
    }
  }

  Future<void> getData() async {
    isLoading.value = true;
    await _db.initialize();
    _db.realm
        .query<schema.Contact>(
            "user._id == '${FirebaseAuth.instance.currentUser?.uid}'")
        .changes
        .listen((changes) {
      contacts.value = changes.results.toList();
    });
    isLoading.value = false;
  }

  List<schema.Contact> onSearch(String value) {
    if (value.isNotEmpty) {
      return _db.realm.query<schema.Contact>(
          "user._id == '${FirebaseAuth.instance.currentUser?.uid}' AND name CONTAINS[c] '$value' OR phone CONTAINS[c] '$value'").toList();
    } else{
      return [];
    }
  }
}
