
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/screens/widget/category_screen_widget/categoryItemWidget.dart';

import '../models/category_item_model.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'Category Screen';

List <CategoryModel> category = CategoryModel.getCategory();
Function onCategorySelected;

CategoryScreen(this.onCategorySelected);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.selectCategory, style: Theme.of(context).textTheme.bodyLarge,),
          // SizedBox(height: 5),
          // Text('of Interest', style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              itemCount: category.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategorySelected(category[index]);
                  },
                  child: CatergoryItemWidget(category[index], index),);
              },),
          ),
        ],
      ),
    );
  }
}
