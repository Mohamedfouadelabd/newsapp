

import 'package:flutter/material.dart';
import 'package:newsapp/model/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  CategoryItem({required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: categoryModel.color,
      borderRadius: BorderRadius.circular(10),

      ),
      child: Column(

        children: [


          Image.asset(categoryModel.imageUrl),
          Text(categoryModel.title,
          style: Theme.of(context).textTheme.titleMedium,

          ),
        ],
      ),



    );
  }
}
