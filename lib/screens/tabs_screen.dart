import 'package:flutter/material.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/screens/widget/news_item_widget/news_item_widget.dart';
import 'package:news_app/screens/widget/source_item_widget/source_item_widget.dart';
import 'package:provider/provider.dart';

import '../models/SourcesResponse.dart';
import '../shared/network/remote/api_manager.dart';

class TabsScreen extends StatelessWidget {
  List<Sources> sources;

  TabsScreen(this.sources);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            onTap: (value) {
              provider.changeSelectedIndex(value);
            },
            tabs: sources.map(
              (e) {
                return Tab(
                  child:
                      SourceItemWidget(e, sources.indexOf(e) == provider.selectedIndex),
                );
              },
            ).toList(),
          ),
        ),
        FutureBuilder(
          future: ApiManager.getNews(sources[provider.selectedIndex].id ?? ""),
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
                  Text(snapshot.data?.message ?? ""),
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
                    return NewsItem(newsData[index]);
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
