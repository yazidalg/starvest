import 'package:get/get.dart';
import 'package:starvest/src/controllers/balance_controller.dart';
import 'package:starvest/src/controllers/top_gainer/top_gainer_repository.dart';
import 'package:starvest/src/controllers/top_loser/top_loser_repository.dart';
import 'package:starvest/src/controllers/trending/trending_repository.dart';
import 'package:starvest/src/models/balance.dart';
import 'package:starvest/src/models/top_loser.dart';

import '../models/top_gainer.dart';
import '../models/trending_stock.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  Rx<TopGainer> topGainer = TopGainer().obs;
  Rx<TrendingStock> trendingStock = TrendingStock().obs;
  Rx<Balancer> balancer = Balancer().obs;
  Rx<TopLoser> topLoser = TopLoser().obs;

  @override
  void onInit() {
    getTopGainer();
    getTrending();
    getBalance();
    getTopLoser();
    super.onInit();
  }

  @override
  void onReady() {
    getTopGainer();
    getTrending();
    getBalance();
    getTopLoser();
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

  Future getTopLoser() async {
    try {
      isLoading.value = true;
      final data = await TopLoserRepository.getTopLoser();
      topLoser.value = data;
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
