import 'package:flutter/material.dart';
import 'package:newsapp/Category/category_Detils.dart';
import 'package:newsapp/Home/category_fragment.dart';
import 'package:newsapp/Search/news_search.dart';
import 'package:newsapp/Theme/my_them.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/model/CategoryModel.dart';


import '../Category/category.dart';
import 'drawer_Item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.white,
          child: Image.asset(
            'assets/images/main_background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle),
         actions: [IconButton(onPressed: (){
           showSearch(context: context, delegate: NewsSearch());

         }, icon:Icon(Icons.search,
         size: 40,
         ))],
          ),
          drawer: DraweItem(),
          body: selectedCategory == null
              ? CategoryFragment(onCategoryClick: onCategoryClick)
              : Category(categoryModel: selectedCategory!),
        ),
      ],
    );
  }
  CategoryModel? selectedCategory;
  void onCategoryClick(CategoryModel newCategory) {
    setState(() {
      selectedCategory = newCategory;
    });
  }
}
