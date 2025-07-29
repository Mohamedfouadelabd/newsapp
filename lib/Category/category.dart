

import 'package:flutter/material.dart';
import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/Category/tap_bar.dart';
import 'package:newsapp/Theme/my_them.dart';
import 'package:newsapp/model/CategoryModel.dart';

import '../model/SourceResponse.dart';

class Category extends StatefulWidget {
CategoryModel categoryModel;
Category({required this.categoryModel});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
@override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManger.getSources(widget.categoryModel.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primary,
              ),
            );

          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('went wrong '),
              ElevatedButton(onPressed: (){}, child: Text('Try Again'))
              ],
            );
          }
      if(snapshot.data?.status!='ok'){
        return Text(snapshot.data?.message??"");

      }
      var sourceList=snapshot.data?.sources??[];
      return  TapBar(sourceList: sourceList,);

      },);
  }
}
