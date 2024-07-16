import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ngontak/app/database/database.dart';
import 'package:ngontak/app/database/schema.dart' as schema;
import 'package:realm/realm.dart';

class AddController extends GetxController {
  final Database _db = Database();
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  TextEditingController name = TextEditingController(text: "");
  RxString nameError = "".obs;

  TextEditingController telp = TextEditingController(text: "");
  RxString telpError = "".obs;

  @override
  void onReady() async {
    super.onReady();

    if (auth.currentUser == null) {
      Get.offAllNamed("/login");
    }

    await _db.initialize();
  }

  void add() async {
    try {
      if (name.text.isEmpty) {
        nameError.value = "Nama tidak boleh kosong";
      }

      if (telp.text.isEmpty) {
        telpError.value = "No telp tidak boleh kosong";
      }

      if (name.text.isNotEmpty && telp.text.isNotEmpty) {
        isLoading.value = true;

        final checkTelp = _db.realm
            .query<schema.Contact>(
                "phone == '${telp.text}' && user._id == '${auth.currentUser?.uid}'")
            .isEmpty;
        if (checkTelp) {
          final user = _db.realm
              .query<schema.User>("_id == '${auth.currentUser?.uid}'")
              .first;
          final contact = schema.Contact(ObjectId(), name.text, telp.text, DateTime.now(), user: user);
          _db.realm.write(() => {_db.realm.add(contact)});
          Get.back();
        } else {
          telpError.value = "No telp sudah terdaftar";
        }

        isLoading.value = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isLoading.value = false;
      Get.snackbar("Kesalahan", "Terjadi kesalahan pada server");
    }
  }
}
