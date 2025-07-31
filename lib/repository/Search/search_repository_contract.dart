import 'package:newsapp/model/NewsSoureResponse.dart';

abstract class SearchRepositoryContract{

 Future<NewsSourceResponse?> getNewsBySearch(String query);
}

abstract class SearchRemoteData{

  Future<NewsSourceResponse?> getNewsBySearch(String query);
}