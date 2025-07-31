
import 'package:flutter/material.dart';

import 'package:newsapp/model/CategoryModel.dart';

import 'category_Item.dart';

class CategoryFragment extends StatelessWidget {
Function onCategoryClick;
CategoryFragment({required this.onCategoryClick});
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
                crossAxisCount: 2,crossAxisSpacing: 10,
mainAxisSpacing: 10,
              mainAxisExtent: MediaQuery.of(context).size.height*0.3

            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){

                    onCategoryClick(categoryList[index]);
                  },

                  child: CategoryItem(categoryModel:categoryList[index])) ;
            },


          ),
        ),


      ],
    );
  }
}
