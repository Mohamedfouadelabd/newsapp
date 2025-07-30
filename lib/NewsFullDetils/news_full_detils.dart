import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Theme/my_them.dart';
import '../model/NewsSoureResponse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsFullDetils extends StatelessWidget {
  static const String routeName = 'news_full';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as News;
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
            title: Text(args.author ?? ""),
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.all(7),
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: CachedNetworkImage(
                  imageUrl: args.urlToImage ?? "",
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: MyTheme.primary,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  args.title ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  args.description ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  args.content ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  args.publishedAt ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              InkWell(
                onTap: () {
                  launchNewsUrl(args.url??'');

                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.3,
                    top: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.readMore,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.primary),
                      ),
                      Icon(
                        Icons.arrow_circle_right_rounded,
                        color: MyTheme.primary,
                        size: 30,
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  Future<void> launchNewsUrl(String url) async {
    var uri=Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ');
    }
  }

}
