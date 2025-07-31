import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/Searche_Detils/Cubit/search_view_Model.dart';
import 'package:newsapp/Searche_Detils/Cubit/state.dart';
import 'package:newsapp/Theme/my_them.dart';

import '../Category/category_detils_item.dart';

import '../repository/Search/datasearch/search_repository_impl.dart';

class SearchTap extends StatefulWidget {
  String query;

  SearchTap({required this.query});
  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
  SearchViewModel viewModel = SearchViewModel(injectSearchRepositoryContract());

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getSearchNews(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primary,
            ),
          );
        } else if (state is ErrorState) {
          return Column(
            children: [
              Text(state.errorMassage ?? ""),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        } else if (state is SuccessState) {
          return ListView.builder(
            itemCount: state.newsList!.length,
            itemBuilder: (context, index) {
              return CategoryDetilsItem(news: state.newsList![index]);
            },
          );
        }
        return Container();
      },
    );
  }
}
