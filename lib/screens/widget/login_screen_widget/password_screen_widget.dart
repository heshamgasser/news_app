import 'package:flutter/material.dart';

class DefaultPasswordTextFormField extends StatelessWidget {
  String labelText;
  IconData prefixIcon;
  IconData suffixIcon;
  bool secured;
  Function onSecuredClicked;
  TextEditingController controller;

  DefaultPasswordTextFormField(
      {required this.labelText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.controller,
      required this.secured,
      required this.onSecuredClicked});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: secured,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onSecondary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onSecondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onSecondary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          ),
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          prefixIcon: Icon(
            prefixIcon,
            size: 30,
          ),
          prefixIconColor: Theme.of(context).primaryColor,
          suffixIcon: IconButton(
            onPressed: () {
              onSecuredClicked();
            },
            icon: Icon(
              suffixIcon,
              size: 30,
            ),
          ),
          suffixIconColor: Theme.of(context).primaryColor,
        ));
  }
}
