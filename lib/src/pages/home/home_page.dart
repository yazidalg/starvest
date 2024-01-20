import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';
import 'package:starvest/src/pages/home/widget/button_nav.dart';
import 'package:starvest/src/pages/home/widget/startup_recommendation.dart';
import 'widget/chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xffF5F5FA),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "assets/background/Intersect.svg",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width / 1,
                    ),
                  ),
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
