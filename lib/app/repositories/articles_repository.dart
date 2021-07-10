import 'package:news_app/app/utils/urls.dart';
import 'package:news_app/core/core_lib.dart';
import 'repository_lib.dart';

class ArticlesRepository extends IArticlesRepository {
  @override
  Future<ResponseModel> getArticeFromAssociatedPress() {
    return getAsync(Urls.associatedPressArticlesUrl);
  }

  @override
  Future<ResponseModel> getArticeFromNextWeb() {
    return getAsync(Urls.nextArticlesWebUrl);
  }
}
