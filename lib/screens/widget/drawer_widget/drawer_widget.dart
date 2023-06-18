
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../setting_screen.dart';

class DrawerWidget extends StatelessWidget {
  static int CATEGORY = 1;
  static int SETTING = 2;
  Function onDrawerClicked;

  DrawerWidget(this.onDrawerClicked);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            accountName: Text('News App'), accountEmail: Text('News App'),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    onDrawerClicked(CATEGORY);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.categories,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, SettingScreen.routeName);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.settings,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
