


import '../../model/NewsSoureResponse.dart';

abstract class SourceState{}
class SourceLoadingState extends SourceState{}
class SourceErrorState extends SourceState{
  String ?errorMassage;
  SourceErrorState({required this.errorMassage});
}
class SourceSuccesState extends SourceState{
  List<News>? newsList;
  SourceSuccesState({required this.newsList});

}