import 'dart:convert';
import '../utils/logger_x.dart';
import 'package:json_sorter/json_sorter.dart';

enum JasonDataType {
  nullValue,
  stringValue,
  intValue,
  doubleValue,
  boolValue,
  listValue,
  mapValue,
  mapListValue,
}

class Jason {
  JasonDataType _dataType = JasonDataType.nullValue;
  String _stringStorage = '';
  List<dynamic> _listStorage = [];
  Map<String, dynamic> _mapStorage = {};

  Jason();

  Jason.from(dynamic value) {
    if (value == null) {
      Jason.fromNull();
    } else if (value is String) {
      Jason.fromString(value);
    } else if (value is int) {
      Jason.fromInt(value);
    } else if (value is double) {
      Jason.fromDouble(value);
    } else if (value is bool) {
      Jason.fromBool(value);
    } else if (value is List<dynamic>) {
      Jason.fromList(value);
    } else if (value is Map<String, dynamic>) {
      Jason.fromMap(value);
    } else if (value is List<Map<String, dynamic>>) {
      Jason.fromMapList(value);
    } else {
      Jason.fromNull();
    }
  }

  Jason.fromNull() {
    clear();
  }

  Jason.fromString(String value) {
    clear();
    _dataType = JasonDataType.stringValue;
    _stringStorage = value;
  }

  Jason.fromInt(int value) {
    clear();
    _dataType = JasonDataType.intValue;
    _stringStorage = value.toString();
  }

  Jason.fromDouble(double value) {
    clear();
    _dataType = JasonDataType.doubleValue;
    _stringStorage = value.toString();
  }

  Jason.fromBool(bool value) {
    clear();
    _dataType = JasonDataType.boolValue;
    if (value == false) {
      _stringStorage = '0';
    } else {
      _stringStorage = '1';
    }
  }

  Jason.fromList(List<dynamic> value) {
    clear();
    _dataType = JasonDataType.listValue;
    _listStorage = [];
    for (var el in value) {
      _listStorage.add(el);
    }
  }

  Jason.fromMap(Map<String, dynamic> value) {
    clear();
    _dataType = JasonDataType.mapValue;
    _mapStorage = {};
    value.forEach((k, v) {
      this[k] = v;
    });
  }

  Jason.fromMapList(List<dynamic> value) {
    clear();
    _dataType = JasonDataType.mapListValue;
    _listStorage = [];
    for (var el in value) {
      _listStorage.add(Jason.fromMap(el));
    }
  }

  JasonDataType get dataType {
    return _dataType;
  }

  void clear() {
    _dataType = JasonDataType.nullValue;
    _stringStorage = '';
    _listStorage = [];
    _mapStorage = {};
  }

  bool get isNull {
    if (_dataType == JasonDataType.nullValue) {
      return true;
    } else {
      return false;
    }
  }

  String get stringValue {
    return _stringStorage;
  }

  int get intValue {
    int value = 0;
    try {
      return int.parse(_stringStorage);
    } catch (e) {
      try {
        var val = double.parse(_stringStorage);
        return val.toInt();
      } catch (e) {
        value = 0;
      }
      value = 0;
    }
    return value;
  }

  double get doubleValue {
    double value = 0.0;
    try {
      return double.parse(_stringStorage);
    } catch (e) {
      try {
        var val = int.parse(_stringStorage);
        return val.toDouble();
      } catch (e) {
        value = 0.0;
      }
      value = 0.0;
    }
    return value;
  }

  bool get boolValue {
    if (intValue <= 0) {
      return false;
    } else {
      return true;
    }
  }

  List<String> get stringListValue {
    return List<String>.from(_listStorage);
  }

  List<int> get intListValue {
    return List<int>.from(_listStorage);
  }

  List<double> get doubleListValue {
    return List<double>.from(_listStorage);
  }

  List<bool> get boolListValue {
    return List<bool>.from(_listStorage);
  }

  List<Jason> get jasonListValue {
    List<Jason> list = [];
    for (var el in _listStorage) {
      list.add(Jason.fromMap(el));
    }
    return list;
  }

  List<dynamic> get listValue {
    return _listStorage;
  }

  Map<String, dynamic> get mapValue {
    var map = <String, dynamic>{};
    _mapStorage.forEach((key, value) {
      if (key.isNotEmpty) {
        if (value.dataType == JasonDataType.nullValue) {
          map[key] = null;
        } else if (value.dataType == JasonDataType.stringValue) {
          map[key] = value.stringValue;
        } else if (value.dataType == JasonDataType.intValue) {
          map[key] = value.intValue;
        } else if (value.dataType == JasonDataType.doubleValue) {
          map[key] = value.doubleValue;
        } else if (value.dataType == JasonDataType.boolValue) {
          map[key] = value.boolValue;
        } else if (value.dataType == JasonDataType.listValue) {
          map[key] = value.listValue;
        } else if (value.dataType == JasonDataType.mapValue) {
          map[key] = value.mapValue;
        }
      }
    });
    var sorted = jsonSortedEncode(map);
    map = json.decode(sorted);
    return map;
  }

  List<Map<String, dynamic>> get mapListValue {
    List<Map<String, dynamic>> list = [];
    for (var el in _listStorage) {
      list.add(el);
    }
    return list;
  }

  Jason operator [](String key) {
    if (key.isNotEmpty) {
      Jason? value = _mapStorage[key];
      if (value != null) {
        return value;
      } else {
        return Jason();
      }
    } else {
      return Jason();
    }
  }

  operator []=(String key, dynamic value) {
    if (key.isNotEmpty) {
      if (_dataType != JasonDataType.mapValue) {
        _dataType = JasonDataType.mapValue;
        _stringStorage = '';
        _listStorage = [];
        _mapStorage = {};
      }
      if (value == null) {
        _mapStorage[key] = Jason.fromNull();
      } else if (value is String) {
        _mapStorage[key] = Jason.fromString(value);
      } else if (value is int) {
        _mapStorage[key] = Jason.fromInt(value);
      } else if (value is double) {
        _mapStorage[key] = Jason.fromDouble(value);
      } else if (value is bool) {
        _mapStorage[key] = Jason.fromBool(value);
      } else if (value is List<dynamic>) {
        _mapStorage[key] = Jason.fromList(value);
      } else if (value is Map<String, dynamic>) {
        _mapStorage[key] = Jason.fromMap(value);
      } else if (value is Jason) {
        _mapStorage[key] = Jason.fromMap(value.mapValue);
      } else {
        _mapStorage[key] = Jason.fromNull();
      }
    }
  }

  static Jason decode(String source) {
    if (source.isNotEmpty) {
      try {
        var obj = json.decode(source);
        return decodeFromJson(obj);
      } catch (e) {
        return Jason();
      }
    } else {
      return Jason();
    }
  }

  static Jason decodeFromJson(dynamic source) {
    if (source.isNotEmpty) {
      try {
        var sorted = jsonSortedEncode(source);
        var obj = json.decode(sorted);
        if (obj == null) {
          return Jason();
        } else {
          if (obj is List<Map<String, dynamic>>) {
            return Jason.fromMapList(obj);
          } else if (obj is Map<String, dynamic>) {
            return Jason.fromMap(obj);
          } else if (obj is List<dynamic>) {
            return Jason.fromList(obj);
          } else {
            return Jason();
          }
        }
      } catch (e) {
        return Jason();
      }
    } else {
      return Jason();
    }
  }

  String prettyJson(dynamic json) {
    var spaces = ' ' * 4;
    var encoder = JsonEncoder.withIndent(spaces);
    return encoder.convert(json);
  }

  String encoded({bool minify = false}) {
    if (dataType == JasonDataType.listValue) {
      if (minify == false) {
        return prettyJson(mapListValue);
      } else {
        return json.encode(mapListValue);
      }
    } else {
      if (minify == false) {
        return prettyJson(mapValue);
      } else {
        return json.encode(mapValue);
      }
    }
  }

  static demoParseInvalidJson() async {
    var source = 'xxd';
    var jason = Jason.decode(source);
    LoggerX.logSeparated('[Jason.demoParseInvalidJson]\n${jason.encoded()}');
  }

  static demoParseObject() async {
    var source =
        '{"celebs":[{"name":"Christina"},{"name":"Robert"}],"family":{"children":3,"spouse":"Ariana Grande"},"id":1001,"name":"John Doe","partners":["Thomas Eddison","Billie Jean","Mike Tyson"],"score":8.8,"validated":true}';
    var jason = Jason.decode(source);
    LoggerX.logSeparated('[Jason.demoParseObject]\n${jason.encoded()}');
    LoggerX.log('id = ${jason['id'].intValue}');
    LoggerX.log('name = ${jason['name'].stringValue}');
    LoggerX.log('spouse = ${jason['family']['spouse'].stringValue}');
    LoggerX.log('score = ${jason['score'].doubleValue}');
    LoggerX.log('partners:');
    var partners = jason['partners'];
    var index = 0;
    for (var el in partners.stringListValue) {
      LoggerX.log('\t[$index] $el');
      index += 1;
    }
    LoggerX.log('celebs:');
    var celebs = jason['celebs'];
    index = 0;
    for (var el in celebs.jasonListValue) {
      LoggerX.log('\t[$index] ${el['name'].stringValue}');
      index += 1;
    }
  }

  static demoParseArray() async {
    var source =
        '[{"name":"Wulan Guritno"},{"name":"Dian Sastrowardoyo"},{"name":"Sophia Latjuba"}]';
    var jason = Jason.decode(source);
    LoggerX.logSeparated('[Jason.demoParseArray]\n${jason.encoded()}');
    LoggerX.log('objects:');
    var index = 0;
    for (var el in jason.jasonListValue) {
      LoggerX.log('\t[$index] ${el['name'].stringValue}');
    }
  }

  static demoComposeObject() async {
    var jason = Jason();
    jason['id'] = 1001;
    jason['name'] = 'John Doe';
    jason['score'] = 8.8;
    jason['validated'] = true;
    jason['partners'] = ['Thomas Eddison', 'Billie Jean', 'Mike Tyson'];
    var family = Jason();
    family['spouse'] = 'Ariana Grande';
    family['children'] = 3;
    jason['family'] = family;
    LoggerX.logSeparated('[Jason.demoComposeObject]\n${jason.encoded()}');
  }

  static demoMinify() async {
    var source =
        '{"family":{"children":3,"spouse":"Ariana Grande"},"id":1001,"name":"John Doe","partners":["Thomas Eddison","Billie Jean","Mike Tyson"],"score":8.8,"validated":true}';
    var jason = Jason.decode(source);
    LoggerX.logSeparated('[Jason.demoMinify]\n${jason.encoded(minify: true)}');
  }

  static demo() async {
    demoParseInvalidJson();
    demoParseObject();
    demoParseArray();
    demoComposeObject();
    demoMinify();
    await Future.delayed(const Duration(seconds: 2));
  }
}
