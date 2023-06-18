
import 'package:flutter/material.dart';
import 'package:news_app/screens/widget/setting_screen_widget/theme_item_dialog.dart';

class ThemeItemWidget extends StatelessWidget {
  String text;
  String optionOne;
  String optionTwo;


  ThemeItemWidget(
      {required this.text,
      required this.optionOne,
      required this.optionTwo,
     });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return ThemeItemDialog();
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
