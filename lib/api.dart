import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'model.dart';

Future<List<DataBanner>?> getDataBanner() async {
  try {
    http.Response response =
        await http.get(Uri.parse("https://food.mockable.io/v1/banner"));
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<DataBanner> dataResult = [];
      jsonData['data'].map((i) => dataResult.add(DataBanner.fromJson(i))).toList();
      return dataResult;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
