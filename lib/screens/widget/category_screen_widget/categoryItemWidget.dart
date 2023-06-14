import 'package:flutter/material.dart';
import '../../../models/category_item_model.dart';

class CatergoryItemWidget extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CatergoryItemWidget(this.categoryModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 171,
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: index.isEven ? Radius.circular(20) : Radius.zero,
            bottomRight: index.isOdd ? Radius.circular(20) : Radius.zero,),
      ),
      child: Column(
        children: [
          Image.asset(
            categoryModel.image,
            height: 120,
          ),
          Expanded(
            child: Center(
                child: Text(
              categoryModel.name,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ),
        ],
      ),
    );
  }
}
