import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngontak/app/database/database.dart';
import 'package:ngontak/app/database/schema.dart' as schema;

class DetailController extends GetxController {
  final Database _database = Database();
  schema.Contact? contact;

  RxString name = "".obs;
  RxString phone = "".obs;

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() async {
    try {
      await _database.initialize();
      final result = _database.realm.find<schema.Contact>(Get.arguments);
      if (result != null) {
        result.changesFor(['name', 'phone']).listen((data) {
          name.value = result.name;
          phone.value = result.phone;
          contact = result;
        });
      } else {
        showDialog(
          context: Get.overlayContext!,
          builder: (context) {
            return AlertDialog(
              title: const Text('Tidak menemukan kontak!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      showDialog(
        context: Get.overlayContext!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Terjadi kesalahan!'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void deleteData() async {
    try {
      if (contact != null) {
        _database.realm.write(() {
          _database.realm.delete(contact!);
        });
      }

      Get.back();
      Get.back();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      showDialog(
        context: Get.overlayContext!,
        builder: (context) {
          return AlertDialog(
            title: const Text('Terjadi kesalahan!'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
