import 'package:dio/dio.dart';
import 'package:starvest/src/models/top_gainer.dart';
import 'package:starvest/src/util/constant.dart';
import 'package:starvest/src/util/endpoint.dart';

class TopGainerRepository {
  static Future<TopGainer> getTopGainer() async {
    String url = baseApiUrlProd + Endpoint.topGainer;
    final Dio _dio = Dio();
    TopGainer topGainer = TopGainer();

    try {
      Response response = await _dio.get(
        url,
        options: Options(headers: {
          "X-API-KEY": goapiApiKey,
        }),
      );

      if (response.statusCode == 200) {
        topGainer = TopGainer.fromJson(response.data);
        return topGainer;
      }
      return topGainer;
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }
}
