import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngontak/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.EDIT, arguments: Get.arguments),
            icon: const Icon(Icons.edit),
          ),
        
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: .3.dp
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: .4.h),
            ListTile(
              title: const Text("Name"),
              subtitle: Obx(() => Text(controller.name.value)),
            ),

            ListTile(
              title: const Text("No Telp"),
              subtitle: Obx(() => Text(controller.phone.value)),
            ),

            MaterialButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) =>  AlertDialog(
                  title: const Text("Hapus Kontak"),
                  content: const Text("Apakah anda yakin ingin menghapus kontak ini?"),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () => controller.deleteData(),
                      child: const Text("Hapus"),
                    )
                  ],
                ),
              ),
              elevation: 0.0,
              color: Colors.transparent,
              textColor: Colors.red.shade900,
              highlightElevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(.2.dp)
              ),
              child: const Text("Hapus Kontak"),
            )
          ],
        ),
      )
    );
  }
}
