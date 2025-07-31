import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/Searche_Detils/Cubit/state.dart';

import '../../repository/Search/search_repository_contract.dart';

class SearchViewModel extends Cubit<Searchstate>{
  SearchRepositoryContract repositoryContract;
  SearchViewModel(this.repositoryContract):super(LoadingState());
  getSearchNews(String query )async{
try {
  emit(LoadingState());
  var response=await repositoryContract.getNewsBySearch(query);
  if(response?.status=='error'){
    emit(ErrorState(errorMassage: response!.message));
  }else{
    emit(SuccessState(newsList: response!.articles));

  }
} catch(e){

  emit(ErrorState(errorMassage: 'error'));
}



  }


}