import 'dart:convert';


import 'package:http/http.dart' as http;
import '../../../models/NewsResponse.dart';
import '../../../models/SourcesResponse.dart';
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

   static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(
      BASEURL,
      NEWS_ENDPOINT,
      {
        'apiKey': APIKEY,
        'sources': sourceId,
      },
    );
    http.Response response = await http.get(url);
    var newsJson = jsonDecode(response.body);
    NewsResponse article = NewsResponse.fromJson(newsJson);
    return article;
  }



}
