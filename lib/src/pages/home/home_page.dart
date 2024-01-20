import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:starvest/src/components/button_secondary_component.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';
import 'package:starvest/src/pages/home/widget/card_balance_widget.dart';
import 'package:starvest/src/pages/home/widget/startup_recommendation_widget.dart';
import 'package:starvest/src/util/constant.dart';
import 'widget/chart_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xffF5F5FA),
      body: Container(
        margin: const EdgeInsets.only(bottom: 30),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SvgPicture.asset(
                    "assets/background/Intersect.svg",
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width / 1,
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      const ChartWidget(),
                      const CardBalanceWidget(),
                      StartupRecommendationWidget(controller: controller),
                      const SizedBox(height: 30),
                      SecondaryButtonComponent(
                        color: colorPrimary,
                        title: "See More",
                        onTap: () {},
                        width: 160,
                        height: 36,
                      )
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
