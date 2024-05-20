import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shortcap/enum/main_category.dart';
import 'package:shortcap/model/dto/subcategory_list.dart';

class NetworkService {
  static const List<MainCategory> mainCategory = MainCategory.values;

  static Future<List<SubCategory>> getSubCategoryList(int mainCategoryIndex) async {
    String mainCategoryName = mainCategory[mainCategoryIndex].name.toUpperCase();
    String url = "http://15.165.250.47:8080/api/categories?mainCategory=" + mainCategoryName;

    final response = await http.get(Uri.parse(url));

    List<dynamic> jsonList = jsonDecode(utf8.decode(response.bodyBytes))["data"]["subCategoryList"];

    return jsonList.map((json) => SubCategory.fromJson(json)).toList();
  }
}