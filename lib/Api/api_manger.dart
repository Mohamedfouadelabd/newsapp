import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/Api/api_const.dart';
import 'package:newsapp/model/NewsSoureResponse.dart';
import 'package:newsapp/model/SourceResponse.dart';

class ApiManger {
  ApiManger._();
  static ApiManger? _instance ;
 static ApiManger getApiInstance(){
    _instance??=ApiManger._();
  return _instance!;
  }

  Future<SourceResponse?> getSources(String categoryId) async {
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=52d507d633b5495ab3f5606930cc5fa7

 */

    Uri url = Uri.https(ApiConst.baseurl, ApiConst.source, {
      'apiKey': '52d507d633b5495ab3f5606930cc5fa7',
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  Future<NewsSourceResponse> getNewsResponse(String id) async {
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=52d507d633b5495ab3f5606930cc5fa7
     */
    Uri url = Uri.https(ApiConst.baseurl, ApiConst.everything, {
      'apiKey': '52d507d633b5495ab3f5606930cc5fa7',
      'sources': id,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsSourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

 Future<NewsSourceResponse> searchNews(String query) async {
    /*
    https://newsapi.org/v2/everything?q=bitcoin&apiKey=52d507d633b5495ab3f5606930cc5fa7
     */
    Uri url = Uri.https(ApiConst.baseurl, ApiConst.everything,
        {'apiKey': '52d507d633b5495ab3f5606930cc5fa7', 'q': query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsSourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
