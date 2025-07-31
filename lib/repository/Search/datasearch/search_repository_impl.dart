import 'package:newsapp/model/NewsSoureResponse.dart';
import 'package:newsapp/repository/Search/datasearch/search_remote_data.dart';

import '../search_repository_contract.dart';



class SearchRepositoryImpl implements SearchRepositoryContract{
  SearchRemoteData remoteData;
  SearchRepositoryImpl({required this.remoteData});
  @override
  Future<NewsSourceResponse?> getNewsBySearch(String query) {
 return remoteData.getNewsBySearch(query);
  }



}
SearchRepositoryContract injectSearchRepositoryContract(){

  return SearchRepositoryImpl(remoteData: injectSearchRemoteData());
}

