import 'dart:convert';

import 'package:app_template/models/ArticleResponse.dart';
import 'package:app_template/models/SourcesResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../components/constant.dart';

class ApiManager {
  static Future<SourcesResponse> getSources() async {
    Uri url = Uri.https(
      BASEURL,
      SOURCES_ENDPOINT,
      {'apiKey': APIKEY},
    );

    http.Response response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);

    SourcesResponse source = SourcesResponse.fromJson(jsonResponse);

    return source;
  }

   static Future<ArticleResponse> getNews(String sourceId) async {
    Uri url = Uri.https(
      BASEURL,
      NEWS_ENDPOINT,
      {
        'apiKey': APIKEY,
        'sources': sourceId
      },
    );
    http.Response response = await http.get(url);
    var newsJson = jsonDecode(response.body);
    ArticleResponse article = ArticleResponse.fromJson(newsJson);
    return article;
  }
}