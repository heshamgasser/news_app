import 'package:app_template/provider/home_provider.dart';
import 'package:app_template/screens/category_screen.dart';
import 'package:app_template/screens/news_screen.dart';
import 'package:app_template/screens/setting_screen.dart';
import 'package:app_template/screens/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var provider = Provider.of<HomeProvider>(context);
        return Scaffold(
          drawer: DrawerWidget(provider.onDrawerClicked,),
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
              provider.categoryModel == null
                  ? 'News App'
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
