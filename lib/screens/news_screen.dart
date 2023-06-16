import 'package:app_template/models/category_item_model.dart';
import 'package:app_template/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../shared/network/remote/api_manager.dart';

class NewsScreen extends StatelessWidget {

 CategoryModel categoryModel;

 NewsScreen(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Something Went Wrong'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                ),
              ],
            ),
          );
        }

        if (snapshot.data?.status != 'ok') {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Something Went Wrong'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                ),
              ],
            ),
          );
        }

        var sources = snapshot.data?.sources ?? [];
        return TabsScreen(sources);

      },
    );
  }
}
