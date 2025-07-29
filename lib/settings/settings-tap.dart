

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/settings/language_sheet.dart';
import 'package:provider/provider.dart';

import '../Theme/my_them.dart';
import '../provider/app_config_provider.dart';
class SettingsTap extends StatefulWidget {
static const String routeName='settings';

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
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
            title: Text(AppLocalizations.of(context)!.settings),


          ),
body: Column(
crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Padding(
  padding: const EdgeInsets.all(20),
  child:   Text(AppLocalizations.of(context)!.chooseLanguage,
  style: Theme.of(context).textTheme.titleLarge,

  ),
),
    InkWell(
onTap: (){
  showLanguage();

},

      child: Container(
        padding: EdgeInsets.all(15),
       margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: MyTheme.primary
          )
        ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text( provider.appLanguage=='en'?(AppLocalizations.of(context)!.english):
    (AppLocalizations.of(context)!.arabic),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: MyTheme.primary
          ),
          ),
Icon(Icons.arrow_drop_down,
size: 30,
  color:MyTheme.primary,

),
        ],
      ),
      ),
    )

  ],

),
        ),
      ],
    );
  }

  void showLanguage() {
    showModalBottomSheet(context: context, builder: (context) {
      return LanguageSheet();


    },);


  }
}
