class TopLoser {
  String? status;
  String? message;
  Data? data;

  TopLoser({this.status, this.message, this.data});

  TopLoser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Results>? results;

  Data({this.results});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? symbol;
  Company? company;
  num? close;
  num? change;
  num? percent;

  Results({this.symbol, this.company, this.close, this.change, this.percent});

  Results.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    close = json['close'];
    change = json['change'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['close'] = close;
    data['change'] = change;
    data['percent'] = percent;
    return data;
  }
}

class Company {
  String? symbol;
  String? name;
  String? logo;

  Company({this.symbol, this.name, this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}
