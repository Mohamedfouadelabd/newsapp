
import 'package:flutter/material.dart';
import 'package:newsapp/Home/category_Item.dart';
import 'package:newsapp/model/CategoryModel.dart';

class CategoryFragment extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
var categoryList=CategoryModel.getCategory(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(15),
          child: Text('Pick your category\n of interest',
            style: Theme.of(context).textTheme.titleLarge,

          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemBuilder: (context, index) {
              return CategoryItem(categoryModel:categoryList[index]) ;
            },


          ),
        ),


      ],
    );
  }
}
