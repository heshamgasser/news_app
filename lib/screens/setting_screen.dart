import 'package:app_template/screens/widget/setting_screen_widget/language_item_widget.dart';
import 'package:app_template/screens/widget/setting_screen_widget/theme_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = 'Setting Screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            text: AppLocalizations.of(context)!.english,
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
            text: AppLocalizations.of(context)!.light,
            optionOne: AppLocalizations.of(context)!.light,
            optionTwo: AppLocalizations.of(context)!.dark,
          ),
        ],
      ),
    );
  }
}
