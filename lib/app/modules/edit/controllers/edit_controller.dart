import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngontak/app/database/database.dart';
import 'package:ngontak/app/database/schema.dart' as schema;

class EditController extends GetxController {
  final Database _database = Database();
  schema.Contact? contact;
  TextEditingController name = TextEditingController(text: "");
  TextEditingController telp = TextEditingController(text: "");

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
        name.text = result.name;
        telp.text = result.phone;
        contact = result;
      } else {
        Get.back();
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

  void saveData() async {
    try {
      if (contact != null) {
        final objectContact = schema.Contact(
          Get.arguments,
          name.text,
          telp.text,
          contact!.createdAt
        );

        _database.realm.write(() {
          _database.realm.add(
            objectContact,
            update: true,
          );
        });

        Get.back();
      } else {
        print("object contact is null");
        Get.back();
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
}
