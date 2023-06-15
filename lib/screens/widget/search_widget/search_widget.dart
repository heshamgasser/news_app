
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/home_provider.dart';

class SearchWidget extends StatelessWidget {
  Function onsearchedClosed;


  SearchWidget(this.onsearchedClosed);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Saerch Article',
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          prefixIcon: IconButton(
            onPressed: () {
              onsearchedClosed();
            },
            icon: Icon(Icons.close),
          ),
          prefixIconColor: Theme.of(context).primaryColor,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          suffixIconColor: Theme.of(context).primaryColor),

    );
  }
}
