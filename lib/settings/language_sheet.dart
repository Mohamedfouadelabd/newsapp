import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../Theme/my_them.dart';
class LanguageSheet extends StatefulWidget {


  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  @override
  Widget build(BuildContext context) {
   var provider =Provider.of<AppConfigProvider>(context);
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    child: Column(
      children: [

        InkWell(
          onTap: (){
            provider.changeLanguage('en');
          },
          child:  provider.appLanguage=='en'?selected(AppLocalizations.of(context)!.english):
          unselected(AppLocalizations.of(context)!.english),
        ),
        InkWell(
          onTap: (){
            provider.changeLanguage('ar');

          },
          child: provider.appLanguage=='ar'?selected(AppLocalizations.of(context)!.arabic):
              unselected(AppLocalizations.of(context)!.arabic),
        ),

      ],


    ),
    );
  }

Widget selected(String titel){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titel,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: MyTheme.primary
            ),


          ),
          Icon(Icons.check,
            color: MyTheme.primary,

          ),

        ],),
    );
}
Widget unselected(String titel){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Text(titel,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: MyTheme.black
          ),


        ),


      ],),
    );

}

}
