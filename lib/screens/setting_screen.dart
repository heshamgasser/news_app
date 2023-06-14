import 'package:app_template/provider/app_provider.dart';
import 'package:app_template/screens/widget/setting_screen_widget/language_item_widget.dart';
import 'package:app_template/screens/widget/setting_screen_widget/theme_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = 'Setting Screen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 10),
            LanguageItemWidget(
              text: provider.language == 'en'
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              optionOne: AppLocalizations.of(context)!.english,
              optionTwo: AppLocalizations.of(context)!.arabic,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 10),
            ThemeItemWidget(
              text: provider.themeMode == ThemeMode.light
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark,
              optionOne: AppLocalizations.of(context)!.light,
              optionTwo: AppLocalizations.of(context)!.dark,
            ),
          ],
        ),
      ),
    );
  }
}
