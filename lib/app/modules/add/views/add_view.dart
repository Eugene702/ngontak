import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kontak'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: .3.dp,
          vertical: .2.dp
        ),
        child: Column(
          children: [
            Obx(
              () => TextFormField(
                controller: controller.name,
                decoration: InputDecoration(
                  hintText: "Masukan nama kontak",
                  errorText: controller.nameError.value.isNotEmpty ? controller.nameError.value : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.25.dp),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.3.dp),
                    borderSide: BorderSide(
                      color: Colors.blue.shade900
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.3.dp),
                    borderSide: BorderSide(
                      color: Colors.red.shade400
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.3.dp),
                    borderSide: BorderSide(
                      color: Colors.red.shade400
                    ),
                  )
                ),
              ),
            ),

            SizedBox(height: 2.h),

            Obx(
              () => TextFormField(
                controller: controller.telp,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Masukan no telp",
                  errorText: controller.telpError.value.isNotEmpty ? controller.telpError.value : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.25.dp),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.3.dp),
                    borderSide: BorderSide(
                      color: Colors.blue.shade900
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.3.dp),
                    borderSide: BorderSide(
                      color: Colors.red.shade400
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(.3.dp),
                    borderSide: BorderSide(
                      color: Colors.red.shade400
                    ),
                  )
                ),
              ),
            ),

            SizedBox(height: 2.h),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: .4.dp
              ),
              child: Obx(
                () => MaterialButton(
                  onPressed: controller.isLoading.value ? null : controller.add,
                  color: Colors.blue.shade900,
                  textColor: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(.2.dp)
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: .26.dp
                  ),
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      controller.isLoading.value ? SizedBox(
                        width: .3.dp,
                        height: .3.dp,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ) : Icon(Icons.add, size: 20.sp,),
                      SizedBox(width: .1.dp,),
                      Text("Simpan", style: TextStyle(
                        fontSize: 17.sp
                      ),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
