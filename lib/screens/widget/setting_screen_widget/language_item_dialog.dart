import 'package:app_template/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageItemDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                pro.changeLanguage('en');
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.english),
                  Spacer(),
                  Visibility(
                      visible: pro.language == 'en'? true : false,
                      child: Icon(
                        Icons.done,
                        size: 30,
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                pro.changeLanguage('ar');
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.arabic),
                  Spacer(),
                  Visibility(
                      visible: pro.language == 'ar'? true : false,
                      child: Icon(
                        Icons.done,
                        size: 30,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
