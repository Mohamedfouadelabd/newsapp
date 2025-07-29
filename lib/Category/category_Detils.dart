import 'package:flutter/material.dart';
import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/Theme/my_them.dart';
import 'package:newsapp/model/NewsSoureResponse.dart';
import '../model/SourceResponse.dart';
import 'category_detils_item.dart';

class CategoryDetils extends StatefulWidget {
 Source source;
  CategoryDetils({required this.source});

  @override
  State<CategoryDetils> createState() => _CategoryDetilsState();
}

class _CategoryDetilsState extends State<CategoryDetils> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsSourceResponse?>(
      future: ApiManger.getNewsResponse(widget.source.id??""),
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
                  setState(() {}); // Retry
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
    );
  }
}
