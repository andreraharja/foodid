import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<dynamic>?> getDataBrowseClaim(
    {required Map body, required String token}) async {
  try {
    Map<String, String> headersCollect = {
      'Content-Type': 'application/json',
      'x-access-token': token
    };
    final messageCollect =
    jsonEncode({"topic": "TopicKafka.browseClaim", "message": body});
    http.Response response = await http.post(Uri.parse("URL.searchRegister"),
        headers: headersCollect, body: messageCollect);
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> dataResult = [];
      jsonData.map((i) => dataResult.add("THologramClaim.fromJson(i)")).toList();
      return dataResult;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}