import 'package:app_template/screens/setting_screen.dart';
import 'package:app_template/screens/widget/drawer_widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import '../models/category_item_model.dart';

class HomeProvider extends ChangeNotifier {

  CategoryModel? categoryModel = null;

  void onCategorySelected(category) {
      categoryModel = category;
      notifyListeners();
  }

  void onDrawerClicked (int number){
    if (number == DrawerWidget.CATEGORY){
      categoryModel = null;
    } else if (number == DrawerWidget.SETTING){

    }
    notifyListeners();

  }

}