import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/model/NewsSoureResponse.dart';

import '../news_repository_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
 ApiManger apiManger;
 NewsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<NewsSourceResponse?> getNews(String id) async{
   var response=await apiManger.getNewsResponse(id);
 return response;
 }
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
 return NewsRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());


}
