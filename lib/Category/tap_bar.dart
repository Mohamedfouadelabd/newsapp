import 'package:flutter/material.dart';
import 'package:newsapp/Category/category_Detils.dart';
import 'package:newsapp/Category/tap_Item.dart';

import '../model/SourceResponse.dart';

class TapBar extends StatefulWidget {
 List <Source> sourceList;

 TapBar({required this.sourceList});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length:widget.sourceList.length, child:Column(
      children: [

        TabBar(
         onTap: (index){
           selectedindex=index;
setState(() {
  
});
         },
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabs:  widget.sourceList.map((source) =>
              TapItem(isSelected: selectedindex==widget.sourceList.indexOf(source), source: source)).toList(),
        ),
     
     Expanded(child: CategoryDetils(source: widget.sourceList[selectedindex])),
      ],
    ));
  }
}
