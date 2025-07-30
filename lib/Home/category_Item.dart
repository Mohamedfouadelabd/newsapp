

import 'package:flutter/material.dart';
import 'package:newsapp/model/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  CategoryItem({required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(
        color: categoryModel.color,
      borderRadius: BorderRadius.circular(10),

      ),
      child: Column(

        children: [


          Image.asset(categoryModel.imageUrl,
          height: MediaQuery.of(context).size.height*0.2,

          ),
          Text(categoryModel.title,
          style: Theme.of(context).textTheme.titleMedium,

          ),
        ],
      ),



    );
  }
}
