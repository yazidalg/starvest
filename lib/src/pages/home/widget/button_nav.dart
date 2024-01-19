import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.index,
    required this.text,
    required this.controller,
  });

  final int index;
  final String text;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(
            Size(90, 30),
          ),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(
            controller.selectedIndex.value == index
                ? const Color(0xffFED5B5)
                : const Color(0xffF5F5FA),
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
