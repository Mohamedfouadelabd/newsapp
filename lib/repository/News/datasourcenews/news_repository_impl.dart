import 'package:newsapp/model/NewsSoureResponse.dart';


import '../news_repository_contract.dart';
import 'news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepositoryContract{
 NewsRemoteDataSource remoteDataSource;
 NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<NewsSourceResponse?> getNews(String categoryId) {
    return remoteDataSource.getNews(categoryId);
  }

}

NewsRepositoryContract injectNewsRepositoryContract(){

 return NewsRepositoryImpl(remoteDataSource:injectNewsRemoteDataSource() );
}