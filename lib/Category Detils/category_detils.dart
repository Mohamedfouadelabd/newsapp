import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Category%20Detils/cubit/category_detils_view_model.dart';
import 'package:newsapp/Category%20Detils/cubit/ststes.dart';
import 'package:newsapp/Theme/my_them.dart';

import '../model/SourceResponse.dart';
import '../Category/category_detils_item.dart';

class CategoryDetils extends StatefulWidget {
  Source source;

  CategoryDetils({required this.source});

  @override
  State<CategoryDetils> createState() => _CategoryDetilsState();
}

class _CategoryDetilsState extends State<CategoryDetils> {


CategoryDetilsViewModel viewModel=CategoryDetilsViewModel();
@override
  void initState() {
    // TODO: implement initState
    viewModel.getNews(widget.source.id??"");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetilsViewModel,SourceState>(
      bloc: viewModel,
      builder: (context, state) {
          if(state is SourceLoadingState){
            return Center(
              child: CircularProgressIndicator(color: MyTheme.primary),
            );

          }else if(state is SourceErrorState){
            return Column(
              children: [
                Text(state.errorMassage??""),
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Retry
                  },
                  child: Text('Try Again'),
                )
              ],
            );

          }else if(state is SourceSuccesState){
            return ListView.builder(

              itemCount: state.newsList?.length,
              itemBuilder: (context, index) {
                return CategoryDetilsItem(news: state.newsList![index]);
              },
            );

          }
return Container();
        },

    ) ;
  }
}
/*
FutureBuilder<NewsSourceResponse?>(
      future: ApiManger.getNewsResponse(widget.source.id ?? '',),
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
          return Text(snapshot.data?.message ?? "");
        }

        var newsList=snapshot.data?.articles ?? [] ;

        return ListView.builder(

          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return CategoryDetilsItem(news: newsList[index]);
          },
        );
      },
    );
 */