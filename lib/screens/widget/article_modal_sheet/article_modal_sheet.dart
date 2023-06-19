import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/NewsResponse.dart';

class ArticleModalSheet extends StatelessWidget {
  Articles articles;

  ArticleModalSheet(this.articles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min ,
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
                .copyWith(color: Theme.of(context).colorScheme.surface),
          ),
          SizedBox(height: 5),
          Text(
            articles.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white70),
          ),
          SizedBox(height: 5),
          Text(articles.description ?? '', style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: 5),
          Text(articles.publishedAt?.substring(0, 10) ?? '',
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white70))
        ],
      ),
    );
  }
}
