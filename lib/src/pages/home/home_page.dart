import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';
import 'package:starvest/src/pages/home/widget/button_nav.dart';

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
          // subtitle: Consumer<BalanceProvider>(
          //   builder: (context, value, chil) =>
          //       value.balanceModel.balance == null
          //           ? Text(
          //               "0 USD",
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .bodyLarge
          //                   ?.copyWith(color: colorPrimary),
          //             )
          //           : Text(
          //               "${value.balanceModel.balance} USD",
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .bodyLarge
          //                   ?.copyWith(color: colorPrimary),
          //             ),
          // ),
        ),
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
          TextButton(
              onPressed: () {
                controller.getTopGainer();
                controller.getTrending();
              },
              child: Text("test")),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Obx(() {
                  var trend = controller.trendingStock.value.data?.results;
                  return controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: trend!
                                .map(
                                  (data) => Content(
                                    index: 0,
                                    image: data.company!.logo!,
                                    title: "Da",
                                    percent: '12',
                                    price: '12',
                                    controller: controller,
                                  ),
                                )
                                .toList(),
                          ),
                        );
                }),
                Obx(() {
                  var topGainer = controller.topGainer.value.data?.results;
                  return controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Column(
                              children: topGainer!
                                  .map((data) => Content(
                                        index: 1,
                                        image: data.company!.logo!,
                                        title: data.company!.name!,
                                        percent: data.percent.toString(),
                                        price: data.close.toString(),
                                        controller: controller,
                                      ))
                                  .toList()),
                        );
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
