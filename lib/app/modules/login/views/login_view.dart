import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngontak/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("lib/assets/images/ic_icon.png", scale: .075.dp,),
                Text("NGONTAK", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0.sp
                ),)
              ],
            ),
          ),

          Align(
            alignment: const Alignment(0, .9),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: .4.dp
              ),
              child: MaterialButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                padding: EdgeInsets.all(.25.dp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(.2.dp),
                  side: const BorderSide(
                    color: Colors.black
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/assets/images/ic_google.png", scale: .112.dp,),
                    Text("Masuk dengan Google", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                    ),)
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
