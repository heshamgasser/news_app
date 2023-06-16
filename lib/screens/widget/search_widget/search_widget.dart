
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  Function onsearchedClosed;
  Function onsearchedClicked;
  TextEditingController controller;

  SearchWidget(
      {required this.onsearchedClosed,
      required this.controller,
      required this.onsearchedClicked});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
             // controller.text = '';
            },
            icon: Icon(Icons.close),
          ),
          prefixIconColor: Theme.of(context).primaryColor,
          suffixIcon: IconButton(
            onPressed: () {
              onsearchedClicked();
            },
            icon: Icon(Icons.search),
          ),
          suffixIconColor: Theme.of(context).primaryColor),

    );
  }
}
