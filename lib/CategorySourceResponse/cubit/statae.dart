import '../../model/SourceResponse.dart';

abstract class CategorySourceState{}

class SourceLoadingState extends CategorySourceState {}
class SourceErrorState  extends CategorySourceState{
  String ?errorMassage;
  SourceErrorState({required this.errorMassage});
}
class SourceSuccesState  extends CategorySourceState{
  List<Source>? sourceList;
  SourceSuccesState({required this.sourceList});

}