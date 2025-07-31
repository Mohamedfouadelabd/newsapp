import 'package:newsapp/model/SourceResponse.dart';
import 'package:newsapp/repository/Sources/datasource/source_remote_data_source_impl.dart';
import 'package:newsapp/repository/Sources/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSource   sourceRemoteDataSource;
  SourceRepositoryImpl({required this.sourceRemoteDataSource});
  @override
  Future<SourceResponse?> getSource(String categoryId) {
return sourceRemoteDataSource.getSource(categoryId);
  }


}
SourceRepositoryContract  injectSourceRepositoryContract(){
  return SourceRepositoryImpl(sourceRemoteDataSource:injectSourceRemoteDataSource());

}