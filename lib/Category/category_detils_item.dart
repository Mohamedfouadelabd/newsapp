import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Theme/my_them.dart';

import '../model/NewsSoureResponse.dart';

class CategoryDetilsItem extends StatelessWidget {
News news;
CategoryDetilsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
         padding: EdgeInsets.all(7),
        margin: EdgeInsets.all(7),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30)
          ),
          child: CachedNetworkImage(
            imageUrl: news.urlToImage??"",
            placeholder: (context, url) => CircularProgressIndicator(
              color: MyTheme.primary,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(news.title??"",

  style: Theme.of(context).textTheme.titleSmall,

  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(news.description??"",
    style: Theme.of(context).textTheme.titleSmall,
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(news.publishedAt??'',
  style: Theme.of(context).textTheme.bodySmall,

  ),
),
      ],

    );
  }
}
