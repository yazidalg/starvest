import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.index,
    required this.title,
    required this.percent,
    required this.price,
    required this.image,
    required this.controller,
  });

  final int index;
  final String title;
  final String price;
  final String percent;
  final String image;
  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity: controller.selectedIndex.value == index ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: ListTile(
            contentPadding: const EdgeInsets.only(right: 16),
            leading: Image.network(
              image,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
            trailing: Column(
              children: [
                Text("$price USD"),
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.keyboard_double_arrow_up_outlined,
                        color: Colors.green,
                      ),
                      Text(
                        "$percent%",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
