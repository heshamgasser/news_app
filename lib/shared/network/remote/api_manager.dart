import 'dart:convert';

import 'package:app_template/models/ArticleResponse.dart';
import 'package:app_template/models/SourcesResponse.dart';
import 'package:app_template/models/news_searching_model.dart';
import 'package:http/http.dart' as http;
import '../../components/constant.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.https(
      BASEURL,
      SOURCES_ENDPOINT,
      {'apiKey': APIKEY,
      'category': category},
    );

    http.Response response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);

    SourcesResponse source = SourcesResponse.fromJson(jsonResponse);

    return source;
  }

   static Future<ArticleResponse> getNews(String sourceId, query) async {
    Uri url = Uri.https(
      BASEURL,
      NEWS_ENDPOINT,
      {
        'apiKey': APIKEY,
        'sources': sourceId,
        "q": query
      },
    );
    http.Response response = await http.get(url);
    var newsJson = jsonDecode(response.body);
    ArticleResponse article = ArticleResponse.fromJson(newsJson);
    return article;
  }
  
  
  static Future<NewsSearchingResponse> searchNews (String sourceId, String query) async{
    Uri url = Uri.https(BASEURL, NEWS_ENDPOINT, {
      "apiKey" : APIKEY,
      "sources": sourceId,
      "q": query
    },);
   http.Response response = await http.get(url);
  var jsonResponse = jsonDecode(response.body);
  NewsSearchingResponse newsResponse = NewsSearchingResponse.fromJson(jsonResponse);
  return newsResponse;

  }
}
