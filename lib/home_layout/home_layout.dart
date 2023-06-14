import 'package:app_template/models/category_item_model.dart';
import 'package:app_template/screens/category_screen.dart';
import 'package:app_template/screens/setting_screen.dart';
import 'package:app_template/screens/tabs_screen.dart';
import 'package:app_template/screens/widget/category_screen_widget/categoryItemWidget.dart';
import 'package:app_template/screens/widget/setting_screen_widget/language_item_widget.dart';
import 'package:app_template/shared/network/remote/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

  @override
  Widget build(BuildContext context) {
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
          'News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body:   FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Something Went Wrong'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.data?.status != 'ok') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Something Went Wrong'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                ),
              ],
            );
          }

          var sources = snapshot.data?.sources;
          return CategoryScreen();


            // TabsScreen(sources!);
        },
      ),





    );
  }
}
