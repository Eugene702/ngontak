import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kontak'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: .3.dp,
          vertical: .2.dp
        ),
        child: Column(
          children: [
            TextFormField(
              controller: controller.name,
              decoration: InputDecoration(
                hintText: "Masukan nama kontak",
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
              ),
            ),

            SizedBox(height: 2.h),

            TextFormField(
              controller: controller.telp,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Masukan no telp",
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
              ),
            ),

            SizedBox(height: 2.h),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: .4.dp
              ),
              child: MaterialButton(
                onPressed: () => controller.saveData(),
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
                    Icon(Icons.add, size: 20.sp,),
                    SizedBox(width: .1.dp,),
                    Text("Simpan", style: TextStyle(
                      fontSize: 17.sp
                    ),),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
