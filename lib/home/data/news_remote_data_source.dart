import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:feature_mind_news/common/data/base_error_response.dart';
import 'package:feature_mind_news/home/data/article_response.dart';
import 'package:feature_mind_news/home/data/news_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsRemoteDataSource {
  Future<List<ArticleResponse>> fetchItems({
    String? query,
    int? pageSize,
    int? pageIndex,
  }) async {
    final apiKey = dotenv.env['apiKey'] ?? '';
    final url =
        "https://newsapi.org/v2/everything?apiKey=$apiKey&page=$pageIndex&pageSize=$pageSize&q=$query";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final res = NewsResponseModel.fromJson(jsonDecode(response.body));
      if (res.status == 'ok') {
        return List.from(res.articles ?? []);
      } else {
        final error = BaseErrorResponse.fromJson(jsonDecode(response.body));
        throw Exception(error.message);
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
