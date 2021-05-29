import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:platzi_3rd_challenge/model/designer.dart';

class ModelUtil {
  static const String API = "https://randomuser.me/api";

  static final ModelUtil _instance = ModelUtil._internal();

  final List<DesignerModel> _designers = List.empty(growable: true);

  factory ModelUtil() {
    _getPeople(10).then((value) => _instance._designers.addAll(value));
    return _instance;
  }

  ModelUtil._internal();

  static Future<List<DesignerModel>> _getPeople(int number) async {
    var url = Uri.parse("$API?results=$number");

    return http.get(url)
        .then((response) {
          if (response.statusCode == 200) {
            var data = convert.jsonDecode(response.body) as Map<String, dynamic>;
            var itemCount = data["info"]["results"] as int;
            print('Number of books about http: $itemCount.');
            var list = (data["results"] as List).map((map) => DesignerModel.fromJson(map)).toList();
            list.forEach(print);
            return list;
          } else {
            print('Request failed with status: ${response.statusCode}.');
          }
          return List.empty();
        });
  }

  List<DesignerModel> designers() {
    return _designers;
  }

  static Future<List<DesignerModel>> fetchDesigners(int number) {
    return _getPeople(number);
  }
}
