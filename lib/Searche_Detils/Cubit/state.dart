import '../../model/NewsSoureResponse.dart';

abstract class Searchstate{}

class LoadingState extends Searchstate{}
class ErrorState extends Searchstate{
  String? errorMassage;
  ErrorState({required this.errorMassage});
}
class SuccessState extends Searchstate{
  List<News> ?newsList;
  SuccessState({required this.newsList});


}