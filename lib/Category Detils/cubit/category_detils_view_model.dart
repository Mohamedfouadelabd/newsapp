import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/Category%20Detils/cubit/ststes.dart';


import '../../repository/News/news_repository_contract.dart';

class CategoryDetilsViewModel extends Cubit<SourceState> {
  NewsRepositoryContract repositoryContract;

  CategoryDetilsViewModel(this.repositoryContract) : super(SourceLoadingState());




  void getNews(String id) async {
    try {
      emit(SourceLoadingState());
      var response = await repositoryContract.getNews(id);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMassage: response!.message));
      } else {
        emit(SourceSuccesState(newsList: response!.articles));
      }
    } catch (e) {
    emit(SourceErrorState(errorMassage: 'error'));
    }
  }
}
