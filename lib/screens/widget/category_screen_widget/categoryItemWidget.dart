import 'package:flutter/material.dart';

import '../../../models/category_item_model.dart';

class CatergoryItemWidget extends StatelessWidget {
  CategoryModel categoryModel;


  CatergoryItemWidget(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 171,
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.asset(categoryModel.image),
          Text(categoryModel.name, style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
