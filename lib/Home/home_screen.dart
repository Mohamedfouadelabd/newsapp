

import 'package:flutter/material.dart';
import 'package:newsapp/Home/category_fragment.dart';
import 'package:newsapp/Theme/my_them.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'drawer_Item.dart';
class HomeScreen extends StatelessWidget {
static const String routeName='home_screen';

  @override
  Widget build(BuildContext context) {
    return Stack(
children: [
  Container(
   color: MyTheme.white,
    child: Image.asset('assets/images/main_background.png',
height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,

    ),
  ),

Scaffold(

  appBar:AppBar(
title: Text(AppLocalizations.of(context)!.appTitle),

  ) ,
drawer:  DraweItem (),
body: CategoryFragment(),

),


],



    );
  }
}
