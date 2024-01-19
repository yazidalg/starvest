import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.index,
    required this.text,
    required this.controller,
    required this.firstColor,
    required this.secondColor,
  });

  final int index;
  final String text;
  final HomeController controller;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          minimumSize: MaterialStatePropertyAll(
            Size(text.length.toDouble(), 30),
          ),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(
            controller.selectedIndex.value == index ? firstColor : secondColor,
          ),
          foregroundColor: MaterialStatePropertyAll(
            controller.selectedIndex.value == index
                ? Colors.black
                : Colors.black,
          ),
        ),
        onPressed: () => controller.selectedIndex.value = index,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
