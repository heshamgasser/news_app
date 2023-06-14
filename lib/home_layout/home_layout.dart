import 'package:app_template/models/category_item_model.dart';
import 'package:app_template/screens/category_screen.dart';
import 'package:app_template/screens/news_screen.dart';
import 'package:app_template/screens/setting_screen.dart';
import 'package:app_template/screens/tabs_screen.dart';
import 'package:app_template/screens/widget/category_screen_widget/categoryItemWidget.dart';
import 'package:app_template/screens/widget/setting_screen_widget/language_item_widget.dart';
import 'package:app_template/shared/network/remote/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: categoryModel == null
          ? CategoryScreen(onCategorySelected)
          : NewsScreen(categoryModel!),
    );
  }

  CategoryModel? categoryModel = null;

  void onCategorySelected(category) {
    setState(() {
      categoryModel = category;
    });
  }
}
