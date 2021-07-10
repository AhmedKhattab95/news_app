abstract class Urls {
  static const String ApiKey = "4ad6f761da3c4acd88e608311e4095ea";
  static const String BaseUrl = "https://newsapi.org";

  static String get associatedPressArticlesUrl =>
      _getArticleUrl('associated-press');

  static String get nextArticlesWebUrl => _getArticleUrl('the-next-web');

  static String _getArticleUrl(String source) {
    return "${BaseUrl}/v1/articles?source=${source}&apiKey=${ApiKey}";
  }
}
