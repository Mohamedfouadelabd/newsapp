import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/Theme/my_them.dart';

class CategoryModel {
  String id;
  String title;
  Color color;
  String imageUrl;

  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
    required this.imageUrl,
  });

  static List<CategoryModel> getCategory(BuildContext context) {
    return [
      CategoryModel(
        id: 'sports',
        title: AppLocalizations.of(context)!.sports,
        color: MyTheme.red,
        imageUrl: 'assets/images/ball.png',
      ),
      CategoryModel(
        id: 'general',
        title: AppLocalizations.of(context)!.general,
        color: MyTheme.darkblue,
        imageUrl: 'assets/images/Politics.png',
      ),
      CategoryModel(
        id: 'health',
        title: AppLocalizations.of(context)!.health,
        color: MyTheme.bink,
        imageUrl: 'assets/images/health.png',
      ),
      CategoryModel(
        id: 'business',
        title: AppLocalizations.of(context)!.business,
        color: MyTheme.orange,
        imageUrl: 'assets/images/bussines.png',
      ),
      CategoryModel(
        id: 'entertainment',
        title: AppLocalizations.of(context)!.entertainment,
        color: MyTheme.blue,
        imageUrl: 'assets/images/environment.png',
      ),
      CategoryModel(
        id: 'science',
        title: AppLocalizations.of(context)!.science,
        color: MyTheme.yellow,
        imageUrl: 'assets/images/science.png',
      ),
      CategoryModel(
        id: 'technology',
        title: AppLocalizations.of(context)!.technology,
        color: MyTheme.gray,
        imageUrl: 'assets/images/science.png',
      ),
    ];
  }
}
