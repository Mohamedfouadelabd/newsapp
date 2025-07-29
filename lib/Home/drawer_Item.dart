

import 'package:flutter/material.dart';
import 'package:newsapp/Theme/my_them.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DraweItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            color: MyTheme.primary,
            child: Center(child: Text(AppLocalizations.of(context)!.appTitle,
            style: Theme.of(context).textTheme.titleMedium,

            )),
          ),

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row(

    children: [

      Icon(Icons.list,

      size: 40,

      ),

  SizedBox(

    width: MediaQuery.of(context).size.width*0.05,



  ),

   Text(AppLocalizations.of(context)!.categories,

   style:Theme.of(context).textTheme.titleLarge,



   ),

    ],

  ),
),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child:   Row(

              children: [

                Icon(Icons.settings,

                  size: 40,

                ),

                SizedBox(

                  width: MediaQuery.of(context).size.width*0.05,



                ),

                Text(AppLocalizations.of(context)!.settings,

                  style:Theme.of(context).textTheme.titleLarge,



                ),

              ],

            ),
          ),
        ],
      ),
    );
  }
}
