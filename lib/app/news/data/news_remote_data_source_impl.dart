import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../common/utils/utils.dart';
import '../domain/news_remote_data_source.dart';
import '../domain/paginated_articles.dart';
import '../../../common/data/base_error_response.dart';
import 'news_response_model.dart';

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  @override
  Future<PaginatedArticles> fetchItems({
    String? query,
    int? pageSize,
    int? pageIndex,
  }) async {
    final apiKey = dotenv.env['apiKey'] ?? '';
    final url =
        "https://newsapi.org/v2/everything?apiKey=$apiKey&page=$pageIndex&pageSize=$pageSize&q=$query&language=en";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final res = NewsResponseModel.fromJson(jsonDecode(response.body));
      if (res.status == 'ok') {
        return PaginatedArticles(
            totalResults: res.totalResults ?? 0,
            articles: List.from(res.articles ?? []));
      } else {
        final error = BaseErrorResponse.fromJson(jsonDecode(response.body));
        throw Exception(error.message);
      }
    } else {
      final error = BaseErrorResponse.fromJson(jsonDecode(response.body));
      Utils.log(message: "Error fetching news: ${error.message}");
      if (error.code == 'maximumResultsReached') {
        throw Exception("Can't load more data for now");
      } else {
        throw Exception(error.message ?? 'Failed to load data');
      }
    }
  }
}
