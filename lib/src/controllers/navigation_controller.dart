import 'package:get/get.dart';
import 'package:starvest/src/controllers/top_gainer/top_gainer_repository.dart';
import 'package:starvest/src/controllers/trending/trending_repository.dart';

import '../models/top_gainer.dart';
import '../models/trending_stock.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  Rx<TopGainer> topGainer = TopGainer().obs;
  RxBool isLoading = false.obs;
  Rx<TrendingStock> trendingStock = TrendingStock().obs;

  @override
  void onInit() {
    super.onInit();
    getTopGainer();
    getTrending();
  }

  Future getTopGainer() async {
    try {
      isLoading.value = true;
      final data = await TopGainerRepository.getTopGainer();
      for (var i = 0; i < data.data!.results!.length; i++) {}
      topGainer.value = data;
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
