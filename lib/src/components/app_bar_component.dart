import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:starvest/src/controllers/navigation_controller.dart';
import 'package:starvest/src/util/constant.dart';
import 'package:starvest/src/util/rupiah.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key, required this.photoUrl});

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        trailing: ClipOval(
          child: Image.network(
            photoUrl,
            width: 40,
            height: 40,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
        title: Text(
          "Total Balance",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: const Color(0xff828282)),
        ),
        subtitle: GetBuilder<HomeController>(builder: (controller) {
          var balance = controller.balancer.value.balance;
          if (controller.isLoading.value) {
            return const Text("Load balance");
          } else if (controller.balancer.value.balance == null) {
            return const Text("Failed to catch balance");
          } else {
            return Text(
              RupiahUtils.beRupiah(balance ?? 0),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: colorPrimary),
            );
          }
        }),
      ),
    );
  }
}
