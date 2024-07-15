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
            onPressed: () => Get.toNamed(Routes.EDIT),
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
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: const NetworkImage("https://lh3.google.com/u/0/ogw/AF2bZyhZrkkMoUi83600Y5IKhrpTncYKEhPmQdcwMCerRO3pgA=s32-c-mo"),
                backgroundColor: Colors.transparent,
                radius: .7.dp,
              ),
            ),
        
            SizedBox(height: .4.h),
            ListTile(
              title: const Text("Name"),
              subtitle: const Text("John Doe"),
            ),

            ListTile(
              title: const Text("No Telp"),
              subtitle: const Text("088223755564")
            ),

            MaterialButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) =>  AlertDialog(
                  title: Text("Hapus Kontak"),
                  content: Text("Apakah anda yakin ingin menghapus kontak ini?"),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Hapus"),
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
              child: Text("Hapus Kontak"),
            )
          ],
        ),
      )
    );
  }
}
