import 'package:news_app/app/models/models_lib.dart';
import 'package:news_app/core/core_lib.dart';

abstract class IArticlesRepository extends BaseRepository {
  /// return Task that will contains list of articles from next web api
  Future<ResponseModel> getArticeFromNextWeb();

  /// return Task that will contains list of articles from Associated Press api
  Future<ResponseModel> getArticeFromAssociatedPress();

}
