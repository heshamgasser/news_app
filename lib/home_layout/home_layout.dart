import 'package:app_template/provider/home_provider.dart';
import 'package:app_template/screens/category_screen.dart';
import 'package:app_template/screens/news_screen.dart';
import 'package:app_template/screens/widget/drawer_widget/drawer_widget.dart';
import 'package:app_template/screens/widget/search_widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/category_item_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var provider = Provider.of<HomeProvider>(context);
        return Scaffold(
          drawer: DrawerWidget(
            provider.onDrawerClicked,
          ),
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
            title:
            Text(
                    provider.categoryModel == null
                        ? AppLocalizations.of(context)!.newsApp
                        : provider.categoryModel!.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
          ),
          body: provider.categoryModel == null
              ? CategoryScreen(provider.onCategorySelected)
              : NewsScreen(provider.categoryModel!),
        );
      },
    );
  }
  }
