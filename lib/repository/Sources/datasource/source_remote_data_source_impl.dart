

import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/model/SourceResponse.dart';

import '../source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
 ApiManger apiManger;
 SourceRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse?> getSource(String categoryId) async{
  var response=await apiManger.getSources(categoryId);
return response;
  }
}


SourceRemoteDataSource injectSourceRemoteDataSource(){

 return SourceRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());
}