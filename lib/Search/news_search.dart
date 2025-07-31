import 'package:flutter/material.dart';

import '../Api/api_manger.dart';
import '../Category/category_detils_item.dart';
import '../Theme/my_them.dart';
import '../model/NewsSoureResponse.dart';

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
        FutureBuilder<NewsSourceResponse?>(
          future: ApiManger.searchNews(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: MyTheme.primary),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(
                    onPressed: () {
                      // Retry
                    },
                    child: Text('Try Again'),
                  )
                ],
              );
            }

            if (snapshot.data?.status != 'ok') {
              return Text(snapshot.data?.message ?? "Unknown error");
            }

            var newsList = snapshot.data?.articles ?? [];

            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return CategoryDetilsItem(news: newsList[index]);
              },
            );
          },
        ),



      ],

    );
  }
@override
  ThemeData appBarTheme(BuildContext context) {
  return MyTheme.lightMode;

  }


}