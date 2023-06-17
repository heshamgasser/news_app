import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/NewsResponse.dart';

class ArticleModalSheet extends StatelessWidget {
  Articles articles;

  ArticleModalSheet(this.articles);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            errorWidget: (context, url, error) => Icon(Icons.error),
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
        Text(articles.description ?? ''),
        Text(articles.publishedAt?.substring(0, 10) ?? '',
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey))
      ],
    );
  }
}
