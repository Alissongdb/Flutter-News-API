import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsController {
  final String _apiKey = 'a460a2fead4f41e786658cd4a076db49';
  final String _url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  Future<List<NewsModel>> fetchNews() async {
    final response = await http.get(Uri.parse('$_url$_apiKey'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['articles'];
      return data.map((article) => NewsModel.fromJson(article)).toList();
    } else {
      throw Exception('Falha ao carregar notícias');
    }
  }
}
