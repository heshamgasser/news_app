import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/widget/article_modal_sheet/article_modal_sheet.dart';

import '../../../models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles articles;


  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Theme.of(context).primaryColor,
            isScrollControlled: true,
            clipBehavior: Clip.hardEdge,
            context: context, builder: (context) {
            return ArticleModalSheet(articles);
          },);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? '',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
            ),
            Text(
              articles.source?.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
            ),
            Text(articles.title ?? ''),
            Text(
                articles.publishedAt?.substring(0, 10) ??
                    '',
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey))
          ],
        ),
      ),
    );
  }
}
