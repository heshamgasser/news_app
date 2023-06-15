import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultNameTextFormField extends StatelessWidget {
  String labelText;
  IconData prefixIcon;
  IconData suffixIcon;

  TextEditingController controller;

  DefaultNameTextFormField(
      {required this.labelText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {

        if (value== null || value.isEmpty) {
          return AppLocalizations.of(context)!.fieldRequired;
        }
        return null;
      },
      textInputAction: TextInputAction.next,
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
        suffixIcon: Icon(
          suffixIcon,
          size: 30,
        ),
        suffixIconColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
