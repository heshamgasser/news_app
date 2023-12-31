import 'package:flutter/material.dart';
import '../models/category_item_model.dart';
import '../screens/widget/drawer_widget/drawer_widget.dart';

class HomeProvider extends ChangeNotifier {

  CategoryModel? categoryModel = null;

  int selectedIndex = 0;

  bool searchSelected = false;

  void onSearchedSelected (){
    searchSelected = !searchSelected;
    notifyListeners();
  }

  void changeSelectedIndex (int index){
    selectedIndex = index;
    notifyListeners();
  }

  void onCategorySelected(category) {
      categoryModel = category;
      print(categoryModel!.id);
      notifyListeners();
  }

  void onDrawerClicked (int number){
    if (number == DrawerWidget.CATEGORY){
      categoryModel = null;
      selectedIndex = 0;
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