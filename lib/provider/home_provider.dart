
import 'package:flutter/material.dart';
import '../models/category_item_model.dart';
import '../screens/widget/drawer_widget/drawer_widget.dart';

class HomeProvider extends ChangeNotifier {

  CategoryModel? categoryModel = null;

  void onCategorySelected(category) {
      categoryModel = category;
      notifyListeners();
  }

  void onDrawerClicked (int number){
    if (number == DrawerWidget.CATEGORY){
      categoryModel = null;
    }
    notifyListeners();
  }


  // bool searchSelected = false;
  //
  // void onSearchSelected (){
  //   searchSelected = !searchSelected;
  //   notifyListeners();
  // }

}