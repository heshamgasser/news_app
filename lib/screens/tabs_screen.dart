import 'package:app_template/screens/widget/article_modal_sheet/article_modal_sheet.dart';
import 'package:app_template/screens/widget/source_item_widget/source_item_widget.dart';
import 'package:app_template/shared/network/remote/api_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/SourcesResponse.dart';

class TabsScreen extends StatefulWidget {
  List<Sources> sources;

  TabsScreen(this.sources);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            tabs: widget.sources.map(
                  (e) {
                return Tab(
                  child: SourceItemWidget(
                      e,
                      widget.sources.indexOf(e) == selectedIndex
                          ? true
                          : false),
                );
              },
            ).toList(),
          ),
        ),
        FutureBuilder(
          future: ApiManager.getNews(widget.sources[selectedIndex].id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Something Went Wrong'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.data?.status != 'ok') {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Something Went Wrong'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Try Again'),
                  ),
                ],
              );
            }

            var newsData = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ArticleModalSheet(
                              newsData[index],
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: newsData[index].urlToImage ?? '',
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            Text(
                              newsData[index].source?.name ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(newsData[index].title ?? ''),
                            Text(
                                newsData[index].publishedAt?.substring(0, 10) ??
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
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 5),
                  itemCount: newsData.length),
            );
          },
        )
      ],
    );
  }
}
