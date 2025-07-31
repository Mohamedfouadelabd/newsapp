import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/CategorySourceResponse/cubit/statae.dart';

class CategoryViewModel extends Cubit<CategorySourceState>{
  CategoryViewModel():super(SourceLoadingState());

void getSource(String categoryId)async{
 try{
   emit(SourceLoadingState());
   var response=await ApiManger.getSources(categoryId);
   if(response?.status=='error'){
     emit(SourceErrorState(errorMassage: response!.message));

   }else{
     emit(SourceSuccesState(sourceList: response!.sources));

   }
 }catch(e){
   emit(SourceErrorState(errorMassage: 'error'));
 }

}

}