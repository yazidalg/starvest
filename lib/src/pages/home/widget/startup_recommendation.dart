import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';

import 'button_nav.dart';
import 'content_nav.dart';

class StartupRecommendation extends StatelessWidget {
  const StartupRecommendation({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
              firstColor: const Color(0xffFED5B5),
              secondColor: const Color(0xffF5F5FA),
              index: 0,
              text: "Trends",
              controller: controller,
            ),
            NavItem(
              firstColor: const Color(0xffFED5B5),
              secondColor: const Color(0xffF5F5FA),
              index: 1,
              text: "Top Gainer",
              controller: controller,
            ),
            NavItem(
              firstColor: const Color(0xffD6D9F8),
              secondColor: const Color(0xffF5F5FA),
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
                  itemCount: trend.length,
                  itemBuilder: (context, index) => Content(
                    index: 0,
                    title: trend[index].company?.name ?? "Error",
                    percent: trend[index].percent ?? 0,
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
                  scrollDirection: Axis.vertical,
                  itemCount: topGainer.length,
                  itemBuilder: (context, index) => Content(
                    index: 1,
                    title: topGainer[index].company?.name ?? "Error",
                    percent: topGainer[index].percent ?? 0,
                    price: topGainer[index].close.toString(),
                    image: topGainer[index].company?.logo ?? "Error",
                    controller: controller,
                  ),
                );
              }
            }),
            Obx(() {
              var topLoser = controller.topLoser.value.data?.results;
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (topLoser == null) {
                return const Center(
                  child: Text("Failed to fetch data"),
                );
              } else {
                return ListView.builder(
                  itemCount: topLoser.length,
                  itemBuilder: (context, index) => Content(
                    index: 2,
                    title: topLoser[index].company?.name ?? "Error",
                    percent: topLoser[index].percent ?? 0,
                    price: topLoser[index].close.toString(),
                    image: topLoser[index].company?.logo ?? "Error",
                    controller: controller,
                  ),
                );
              }
            })
          ],
        ),
      ),
    ]);
  }
}
