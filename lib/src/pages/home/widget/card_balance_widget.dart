import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:starvest/src/controllers/navigation_controller.dart';
import 'package:starvest/src/util/constant.dart';
import 'package:starvest/src/util/rupiah.dart';

class CardBalanceWidget extends StatelessWidget {
  const CardBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: const Color(0xffFDC99F),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 6,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "E-wallet balance",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: const Color(0xffF5F5FA)),
                ),
                GetBuilder<HomeController>(builder: (controller) {
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
                          ?.copyWith(color: Color(0xffF5F5FA)),
                    );
                  }
                })
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset("assets/icons/topup.svg"),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Top Up",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xffF5F5FA)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset("assets/icons/transfer.svg"),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Transfer",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xffF5F5FA)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset("assets/icons/withdraw.svg"),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Withdraw",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xffF5F5FA)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
