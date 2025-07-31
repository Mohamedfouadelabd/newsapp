import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/CategorySourceResponse/cubit/statae.dart';

import 'package:newsapp/repository/Sources/source_repository_contract.dart';

class CategoryViewModel extends Cubit<CategorySourceState> {
  SourceRepositoryContract repositoryContract;

  CategoryViewModel(this.repositoryContract) : super(SourceLoadingState());

  void getSource(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await repositoryContract.getSource(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMassage: response!.message));
      } else {
        emit(SourceSuccesState(sourceList: response!.sources));
      }
    } catch (e) {
      emit(SourceErrorState(errorMassage: 'error'));
    }
  }
}
