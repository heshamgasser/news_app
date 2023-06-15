import 'package:app_template/provider/home_provider.dart';
import 'package:app_template/screens/category_screen.dart';
import 'package:app_template/screens/news_screen.dart';
import 'package:app_template/screens/widget/drawer_widget/drawer_widget.dart';
import 'package:app_template/screens/widget/search_widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

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
            title: provider.searchSelected
                ? SearchWidget((){
                  provider.onSearchSelected();
            },)
                : Text(
                    provider.categoryModel == null
                        ? AppLocalizations.of(context)!.newsApp
                        : provider.categoryModel!.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
            actions: [
              Visibility(
                visible: !provider.searchSelected,
                child: IconButton(
                  onPressed: () {
                    provider.onSearchSelected();
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          body: provider.categoryModel == null
              ? CategoryScreen(provider.onCategorySelected)
              : NewsScreen(provider.categoryModel!),
        );
      },
    );
  }
}
