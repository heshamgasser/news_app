import 'package:app_template/screens/widget/setting_screen_widget/language_item_dialog.dart';
import 'package:flutter/material.dart';

class LanguageItemWidget extends StatelessWidget {
  String text;
  String optionOne;
  String optionTwo;


  LanguageItemWidget(
      {required this.text,
      required this.optionOne,
      required this.optionTwo,
     });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context, builder: (context) {
          return LanguageItemDialog();
        },);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Row(
          children: [
            Text(text),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
