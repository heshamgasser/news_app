import 'package:app_template/models/category_item_model.dart';
import 'package:app_template/screens/widget/category_screen_widget/categoryItemWidget.dart';
import 'package:flutter/material.dart';

import '../models/SourcesResponse.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'Category Screen';
List <CategoryModel> category = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Pick Your Category', style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: 5),
            Text('of Interest', style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.builder(
                itemCount: category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),

                itemBuilder: (context, index) {
                return CatergoryItemWidget(category[index]);
              },),
            ),
          ],
        ),
      ),
    );
  }
}
