import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';
import 'package:starvest/src/pages/home/widget/button_nav.dart';
import 'package:starvest/src/pages/home/widget/startup_recommendation.dart';
import 'package:starvest/src/util/rupiah.dart';

import '../../util/constant.dart';
import 'widget/chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xffF5F5FA),
      appBar: AppBar(
        elevation: 1,
        title: ListTile(
            contentPadding: EdgeInsets.zero,
            trailing: ClipOval(
              child: Image.network(
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                user.photoURL!,
              ),
            ),
            title: Text(
              "Total Balance",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: const Color(0xff828282)),
            ),
            subtitle: Obx(() {
              var balance = controller.balancer.value.balance;
              if (controller.isLoading.value) {
                return const Text("Load balance");
              } else if (controller.balancer.value.balance == null) {
                return const Text("Failed to catch balance");
              } else {
                return Text(
                  "${RupiahUtils.beRupiah(balance ?? 0)} USD",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: colorPrimary),
                );
              }
            })),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Container(
                  //   child: Image.asset(
                  //     "assets/background/home_background.png",
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  Column(
                    children: [
                      Chart(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NavItem(
                            firstColor: const Color(0xffD6D9F8),
                            secondColor: const Color(0xffF5F5FA),
                            index: 5,
                            text: "1 Week",
                            controller: controller,
                          ),
                          NavItem(
                            firstColor: const Color(0xffD6D9F8),
                            secondColor: const Color(0xffF5F5FA),
                            index: 5,
                            text: "1 month",
                            controller: controller,
                          ),
                          NavItem(
                            firstColor: const Color(0xffD6D9F8),
                            secondColor: const Color(0xffF5F5FA),
                            index: 5,
                            text: "1 year",
                            controller: controller,
                          ),
                          NavItem(
                            firstColor: const Color(0xffD6D9F8),
                            secondColor: const Color(0xffF5F5FA),
                            index: 5,
                            text: "All",
                            controller: controller,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: StartupRecommendation(controller: controller),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
