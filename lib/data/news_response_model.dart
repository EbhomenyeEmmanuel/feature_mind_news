import 'article_response.dart';

class NewsResponseModel {
  final String? status;
  final int? totalResults;
  final List<ArticleResponse>? articles;

  NewsResponseModel({this.status, this.totalResults, this.articles});

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
        status: json['status'] ?? '',
        totalResults: json['totalResults'] ?? 0,
        articles: List.from(json['articles'] ?? [])
            .map((i) => ArticleResponse.fromJson(i))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
