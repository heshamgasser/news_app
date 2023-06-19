

import 'package:flutter/material.dart';

import '../../../models/SourcesResponse.dart';

class SourceItemWidget extends StatelessWidget {
  Sources source;
  bool selected;

  SourceItemWidget(this.source, this.selected);

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: StadiumBorder(
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      backgroundColor:
          selected ? Theme.of(context).primaryColor : Colors.transparent,
      label: Text(
        source.name ?? '',
        style: selected
            ? Theme.of(context).textTheme.titleMedium
            : Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
