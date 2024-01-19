import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:starvest/src/models/top_loser.dart';
import 'package:starvest/src/util/constant.dart';
import 'package:starvest/src/util/endpoint.dart';

class TopLoserRepository {
  static Future<TopLoser> getTopLoser() async {
    String url = baseApiUrlProd + Endpoint.topLoser;
    final Dio _dio = Dio();
    TopLoser topLoser = TopLoser();

    try {
      Response response = await _dio.get(
        url,
        options: Options(headers: {
          "X-API-KEY": goapiApiKey,
        }),
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        return topLoser = TopLoser.fromJson(response.data);
      }
      return topLoser;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
