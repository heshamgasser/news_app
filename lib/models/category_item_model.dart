
import 'package:flutter/material.dart';

import '../shared/style/app_colors.dart';


class CategoryModel {
 String id;
 String name;
 String image;
 Color color;

 CategoryModel(this.id, this.name, this.image, this.color);
 
 static List <CategoryModel> getCategory (){
   return [
     CategoryModel('business', 'Business', 'assets/images/bussines.png', businessBackgroundColor),
     CategoryModel('entertainment', 'Entertainment', 'assets/images/environment.png', environmentBackgroundColor),
     CategoryModel('health', 'Health', 'assets/images/health.png', healthBackgroundColor),
     CategoryModel('science', 'Science', 'assets/images/science.png', scienceBackgroundColor),
     CategoryModel('sports', 'Sports', 'assets/images/sports.png', sportBackgroundColor),
     CategoryModel('technology', 'Technology', 'assets/images/environment.png', environmentBackgroundColor),
     CategoryModel('general', 'General', 'assets/images/environment.png', businessBackgroundColor),
   ];
 }
 
}