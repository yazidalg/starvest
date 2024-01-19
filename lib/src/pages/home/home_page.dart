import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';
import 'package:starvest/src/pages/home/widget/button_nav.dart';
import 'package:starvest/src/util/rupiah.dart';

import '../../util/constant.dart';
import 'widget/content_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
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
        alignment: Alignment.center,
        child: Column(children: [
          Text(
            "Startup Recomendation",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavItem(
                  index: 0,
                  text: "Trends",
                  controller: controller,
                ),
                NavItem(
                  index: 1,
                  text: "Top Gainer",
                  controller: controller,
                ),
                NavItem(
                  index: 2,
                  text: "Top Loser",
                  controller: controller,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Obx(() {
                  var trend = controller.trendingStock.value.data?.results;
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (trend == null) {
                    return const Text("Failed to fetch data");
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) => Content(
                        index: 0,
                        title: trend[index].company?.name ?? "Error",
                        percent: trend[index].percent.toString(),
                        price: trend[index].close.toString(),
                        image: trend[index].company?.logo ?? "Error",
                        controller: controller,
                      ),
                    );
                  }
                }),
                Obx(() {
                  var topGainer = controller.topGainer.value.data?.results;
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (topGainer == null) {
                    return const Text("Failed to fetch data");
                  } else {
                    return ListView.builder(
                      itemCount: topGainer.length,
                      itemBuilder: (context, index) => Content(
                        index: 1,
                        title: topGainer[index].company?.name ?? "Error",
                        percent: topGainer[index].percent.toString(),
                        price: topGainer[index].change.toString(),
                        image: topGainer[index].company?.logo ?? "Error",
                        controller: controller,
                      ),
                    );
                  }
                }),
                Content(
                  index: 2,
                  image: "",
                  title: "Data",
                  percent: '12',
                  price: '12',
                  controller: controller,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
