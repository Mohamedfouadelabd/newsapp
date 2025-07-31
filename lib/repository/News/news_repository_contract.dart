import 'package:newsapp/model/NewsSoureResponse.dart';

abstract class NewsRepositoryContract{

  Future<NewsSourceResponse?>getNews(String id);

}
abstract class NewsRemoteDataSource {

  Future<NewsSourceResponse?>getNews(String id);
}