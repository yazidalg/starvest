import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:starvest/src/models/trending_stock.dart';
import 'package:starvest/src/util/constant.dart';
import 'package:starvest/src/util/endpoint.dart';

class TrendingRepository {
  static Future<TrendingStock> getTrendingStock() async {
    String url = baseApiUrlProd + Endpoint.trends;
    final Dio _dio = Dio();
    TrendingStock trendingStock = TrendingStock();

    try {
      Response response = await _dio.get(
        url,
        options: Options(headers: {
          "X-API-KEY": goapiApiKey,
        }),
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        trendingStock = TrendingStock.fromJson(response.data);
        return trendingStock;
      }
      return trendingStock;
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }
}
