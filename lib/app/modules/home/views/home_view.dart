import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngontak/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              scrolledUnderElevation: 0.0,
              backgroundColor: Colors.transparent,
              clipBehavior: Clip.none,
              title: Padding(
                padding: EdgeInsets.only(
                  top: .4.dp
                ),
                child: SearchAnchor.bar(
                  barHintText: "Cari kontak kamu disini....",
                  barElevation: WidgetStateProperty.resolveWith((_) => 0.0),
                  barBackgroundColor:
                      WidgetStateColor.resolveWith((_) => Colors.grey.shade300),
                  barTrailing: [
                    IconButton(onPressed: () {}, icon: const FlutterLogo())
                  ],
                  suggestionsBuilder: (context, controller) => List.generate(
                    5,
                    (index) => ListTile(
                      leading: const FlutterLogo(),
                      title: Text("Text ${index + 1}"),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: .3.dp,
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 50,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () => Get.toNamed(Routes.DETAIL),
                        leading: const FlutterLogo(),
                        title: Text("Text ${index + 1}"),
                      ),
                    ))
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () => Get.toNamed(Routes.ADD),
        iconSize: .35.dp,
        tooltip: "Tambah Kontak",
        style: IconButton.styleFrom(
          backgroundColor: Colors.blue.shade900,
          padding: EdgeInsets.all(.3.dp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(.3.dp)),
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
