import 'package:get/get.dart';
import 'package:starvest/src/controllers/balance_controller.dart';
import 'package:starvest/src/controllers/top_gainer/top_gainer_repository.dart';
import 'package:starvest/src/controllers/trending/trending_repository.dart';
import 'package:starvest/src/models/balance.dart';

import '../models/top_gainer.dart';
import '../models/trending_stock.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  Rx<TopGainer> topGainer = TopGainer().obs;
  Rx<TrendingStock> trendingStock = TrendingStock().obs;
  Rx<Balancer> balancer = Balancer().obs;

  @override
  void onInit() {
    getTopGainer();
    getTrending();
    getBalance();
    super.onInit();
  }

  @override
  void onReady() {
    getTopGainer();
    getTrending();
    getBalance();
    super.onReady();
  }

  Future getTopGainer() async {
    try {
      isLoading.value = true;
      final data = await TopGainerRepository.getTopGainer();
      topGainer.value = data;
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future getBalance() async {
    try {
      isLoading.value = true;
      final data = await BalanceRepository.getBalance();
      balancer.value = data;
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future getTrending() async {
    try {
      isLoading.value = true;
      final data = await TrendingRepository.getTrendingStock();
      trendingStock.value = data;
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
