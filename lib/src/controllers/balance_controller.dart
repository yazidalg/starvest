import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:starvest/src/models/balance.dart';
import 'package:starvest/src/util/constant.dart';
import 'package:starvest/src/util/endpoint.dart';

class BalanceRepository {
  static Future<Balancer> getBalance() async {
    String url = baseApiUrlXendit + Endpoint.balance;
    final Dio _dio = Dio();
    Balancer balancer = Balancer();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$xenditToken:$xenditToken'));

    log(basicAuth);
    log(url);

    try {
      _dio.options.headers['authorization'] = basicAuth;
      Response response = await _dio.get(url);

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Balancer newBalancer = Balancer.fromJson(response.data);
        balancer = newBalancer;
        return balancer;
      }
      return balancer;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
