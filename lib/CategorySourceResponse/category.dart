import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/Category/tap_bar.dart';
import 'package:newsapp/CategorySourceResponse/cubit/category-view_model.dart';
import 'package:newsapp/CategorySourceResponse/cubit/statae.dart';
import 'package:newsapp/Theme/my_them.dart';
import 'package:newsapp/model/CategoryModel.dart';
import 'package:newsapp/repository/Sources/datasource/source_repository_impl.dart';

class Category extends StatefulWidget {
  CategoryModel categoryModel;
  Category({required this.categoryModel});

  @override
  State<Category> createState() => _CategoryState();
}
CategoryViewModel viewModel = CategoryViewModel(injectSourceRepositoryContract());

class _CategoryState extends State<Category> {
  @override
  void initState() {
    // TODO: implement initState
  viewModel.getSource(widget.categoryModel.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryViewModel, CategorySourceState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primary,
            ),
          );
        } else if (state is SourceErrorState) {
          return Column(
            children: [
              Text(state.errorMassage ?? ""),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        } else if (state is SourceSuccesState) {
          return TapBar(
            sourceList: state.sourceList!,
          );
        }
        return Container();
      },
    );
  }
}


/*
 FutureBuilder<SourceResponse?>(
      future: ApiManger.getSources(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primary,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('went wrong '),
              ElevatedButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Text(snapshot.data?.message ?? "");
        }
        var sourceList = snapshot.data?.sources ?? [];
        return TapBar(
          sourceList: sourceList,
        );
      },
    );
 */
