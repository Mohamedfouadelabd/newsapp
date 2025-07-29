import 'package:flutter/material.dart';
import 'package:newsapp/Home/home_screen.dart';
import 'package:newsapp/Theme/my_them.dart';
import 'package:newsapp/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: MyTheme.lightMode,
      locale: Locale(provider.appLanguage),
    );
  }

  Future<void> initPref(AppConfigProvider provider) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var language = prefs.getString('Language');
    if (language != null) {
      provider.changeLanguage(language);
    }
  }
}
