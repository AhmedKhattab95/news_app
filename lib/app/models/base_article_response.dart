// To parse this JSON data, do
//
//     final baseResponse = baseResponseFromJson(jsonString);

import 'dart:convert';

import 'models_lib.dart';

BaseArticleResponse baseResponseFromJson(String str) => BaseArticleResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseArticleResponse data) => json.encode(data.toJson());

class BaseArticleResponse {
  const  BaseArticleResponse(
    this.status,
    this.source,
    this.sortBy,
    this.articles,
  );

  final String status;
  final String source;
  final String sortBy;
  final List<Article> articles;

  factory BaseArticleResponse.fromJson(Map<String, dynamic> json) => BaseArticleResponse(
     json["status"],
     json["source"],
     json["sortBy"],
     List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "source": source,
    "sortBy": sortBy,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}