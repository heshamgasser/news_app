import 'package:flutter/material.dart';
import '../models/category_item_model.dart';

class HomeProvider extends ChangeNotifier {

  CategoryModel? categoryModel = null;

  void onCategorySelected(category) {
      categoryModel = category;
      notifyListeners();
  }

}