

import 'package:flutter/material.dart';
import 'package:newsapp/Theme/my_them.dart';

import '../model/SourceResponse.dart';

class TapItem extends StatelessWidget {
Source source;
bool isSelected;
TapItem({required this.isSelected,required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
  
    borderRadius: BorderRadius.circular(20),
  color:isSelected?MyTheme.primary:Colors.transparent,
border:  Border.all(
color: MyTheme.primary,
    width: 3,
)
),
child: Text(source.name??"",
style: TextStyle(
  color: isSelected?MyTheme.white:MyTheme.primary,
fontSize: 20,
  fontWeight: FontWeight.bold
),

),

    );
  }
}
