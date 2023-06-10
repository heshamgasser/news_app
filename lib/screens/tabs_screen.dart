import 'package:app_template/screens/widget/source_item_widget/source_item_widget.dart';
import 'package:app_template/shared/network/remote/api_manager.dart';
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(newsData[index].urlToImage ?? ''),
                        Text(newsData[index].source?.name ?? ''),
                        Text(newsData[index].title ?? ''),
                        Text(newsData[index].publishedAt?.substring(0,10) ?? '', textAlign: TextAlign.end,)
                      ],
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
