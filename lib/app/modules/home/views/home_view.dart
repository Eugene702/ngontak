import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngontak/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                padding: EdgeInsets.only(top: .4.dp),
                child: SearchAnchor.bar(
                  barHintText: "Cari kontak kamu disini....",
                  barElevation: WidgetStateProperty.resolveWith((_) => 0.0),
                  barBackgroundColor:
                      WidgetStateColor.resolveWith((_) => Colors.grey.shade300),
                  barTrailing: [
                    IconButton(onPressed: () {}, icon: const FlutterLogo())
                  ],
                  searchController: controller.searchController,
                  suggestionsBuilder: (context, searchController){
                    return controller.onSearch(searchController.text).map((e) => ListTile(
                      title: Text(e.name),
                      subtitle: Text(e.phone),
                      onTap: () => Get.toNamed(Routes.DETAIL),
                    )).toList();
                  }
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: .3.dp,
                    ),
                    child: Obx(
                      () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.contacts.length,
                        itemBuilder: (context, index) => Skeletonizer(
                          enabled: controller.isLoading.value,
                          child: ListTile(
                            onTap: () => Get.toNamed(Routes.DETAIL),
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  controller.contacts[index].user!.picture),
                            ),
                            title: Text(controller.contacts[index].name),
                          ),
                        ),
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
