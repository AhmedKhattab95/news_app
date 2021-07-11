abstract class Urls {
  static const String ApiKey = "1c0f731cca954a13875e6965f9c7e9de";
  static const String BaseUrl = "https://newsapi.org";

  static String get associatedPressArticlesUrl =>
      _getArticleUrl('associated-press');

  static String get nextArticlesWebUrl => _getArticleUrl('the-next-web');

  static String _getArticleUrl(String source) {
    return "${BaseUrl}/v1/articles?source=${source}&apiKey=${ApiKey}";
  }
}
