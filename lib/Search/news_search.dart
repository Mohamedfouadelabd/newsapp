import 'package:flutter/material.dart';
import 'package:newsapp/Searche_Detils/search_tap.dart';


import '../Theme/my_them.dart';


class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
return [IconButton(onPressed: (){
  showResults(context);

}, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    return buildSuggestions(context);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
   if(query.isEmpty){
     return  Container(
       color: MyTheme.white,
       child: Image.asset(
         'assets/images/main_background.png',
         height: double.infinity,
         width: double.infinity,
         fit: BoxFit.fill,
       ),
     );
   }
    return Stack(
      children: [

        Container(
          color: MyTheme.white,
          child: Image.asset(
            'assets/images/main_background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),

SearchTap(query: query),


      ],

    );
  }
@override
  ThemeData appBarTheme(BuildContext context) {
  return MyTheme.lightMode;

  }


}
