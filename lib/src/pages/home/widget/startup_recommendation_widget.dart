import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';

import 'button_nav_widget.dart';
import 'content_nav_widget.dart';

class StartupRecommendationWidget extends StatelessWidget {
  const StartupRecommendationWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(children: [
        Text(
          "Startup Recomendation",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavItemWidget(
                firstColor: const Color(0xffFED5B5),
                secondColor: Colors.transparent,
                index: 0,
                text: "Trends",
                controller: controller,
              ),
              NavItemWidget(
                firstColor: const Color(0xffFED5B5),
                secondColor: Colors.transparent,
                index: 1,
                text: "Top Gainer",
                controller: controller,
              ),
              NavItemWidget(
                firstColor: const Color(0xffD6D9F8),
                secondColor: Colors.transparent,
                index: 2,
                text: "Top Loser",
                controller: controller,
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView.builder(
                      itemCount: trend.length,
                      itemBuilder: (context, index) => ContentWidget(
                        index: 0,
                        title: trend[index].company?.name ?? "Error",
                        percent: trend[index].percent ?? 0,
                        price: trend[index].close ?? 0,
                        image: trend[index].company?.logo ?? "Error",
                        controller: controller,
                      ),
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: topGainer.length,
                      itemBuilder: (context, index) => ContentWidget(
                        index: 1,
                        title: topGainer[index].company?.name ?? "Error",
                        percent: topGainer[index].percent ?? 0,
                        price: topGainer[index].close!.toInt(),
                        image: topGainer[index].company?.logo ?? "Error",
                        controller: controller,
                      ),
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView.builder(
                      itemCount: topLoser.length,
                      itemBuilder: (context, index) => ContentWidget(
                        index: 2,
                        title: topLoser[index].company?.name ?? "Error",
                        percent: topLoser[index].percent ?? 0,
                        price: topLoser[index].close!.toInt(),
                        image: topLoser[index].company?.logo ?? "Error",
                        controller: controller,
                      ),
                    ),
                  );
                }
              })
            ],
          ),
        ),
      ]),
    );
  }
}
