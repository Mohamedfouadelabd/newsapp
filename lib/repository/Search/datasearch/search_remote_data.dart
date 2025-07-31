import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/model/NewsSoureResponse.dart';

import '../search_repository_contract.dart';

class SearchRemoteDataImp implements  SearchRemoteData{
 ApiManger apiManger;
 SearchRemoteDataImp( {required this.apiManger});
  @override
  Future<NewsSourceResponse?> getNewsBySearch(String query) async{
 var response=await apiManger.searchNews(query) ;
  return response;
  }



}

SearchRemoteData injectSearchRemoteData(){
 return SearchRemoteDataImp(apiManger: ApiManger.getApiInstance());

}