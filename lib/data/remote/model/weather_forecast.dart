/// weather : [{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}]
/// base : "stations"
/// main : {"temp":28,"feels_like":33.75,"temp_min":28,"temp_max":28,"pressure":1002,"humidity":90,"sea_level":1002,"grnd_level":1001}
/// visibility : 10000
/// wind : {"speed":2.92,"deg":304,"gust":5.35}
/// clouds : {"all":100}
/// dt : 1654521384
/// sys : {"type":1,"id":9308,"country":"VN","sunrise":1654467277,"sunset":1654515369}
/// timezone : 25200
/// id : 1581130
/// name : "Hanoi"
/// cod : 200

class WeatherForecast {
  WeatherForecast(
      {List<Weather>? weather,
      Main? main,
      int? dt,
      Sys? sys,
      String? name,
      int? cod}) {
    _weather = weather;
    _main = main;
    _dt = dt;
    _sys = sys;
    _name = name;
    _cod = cod;
  }

  WeatherForecast.fromJson(dynamic json) {
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _name = json['name'];
    _cod = json['cod'];
  }

  List<Weather>? _weather;
  Main? _main;
  int? _dt;
  Sys? _sys;
  String? _name;
  int? _cod;

  List<Weather>? get weather => _weather;

  Main? get main => _main;

  int? get dt => _dt;

  Sys? get sys => _sys;

  String? get name => _name;

  int? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }
}

/// country : "VN"

class Sys {
  Sys({String? country}) {
    _country = country;
  }

  Sys.fromJson(dynamic json) {
    _country = json['country'];
  }

  String? _country;

  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    return map;
  }
}

/// temp : 28
/// temp_min : 28
/// temp_max : 28

class Main {
  Main({
    num? temp,
    num? tempMin,
    num? tempMax,
  }) {
    _temp = temp;
    _tempMin = tempMin;
    _tempMax = tempMax;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
  }

  num? _temp;
  num? _tempMin;
  num? _tempMax;

  num? get temp => _temp;

  num? get tempMin => _tempMin;

  num? get tempMax => _tempMax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    return map;
  }
}

/// main : "Clouds"
/// description : "overcast clouds"
/// icon : "04n"

class Weather {
  Weather({
    String? main,
    String? description,
    String? icon,
  }) {
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  String? _main;
  String? _description;
  String? _icon;

  String? get main => _main;

  String? get description => _description;

  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }
}
