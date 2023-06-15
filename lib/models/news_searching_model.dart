/// status : "ok"
/// totalResults : 5
/// articles : [{"source":{"id":"abc-news","name":"ABC News"},"author":"TIM REYNOLDS AP Sports Writer","title":"Lionel Messi says he's joining Major League Soccer's Inter Miami after exit from Paris Saint-Germain","description":"Lionel Messi says he is coming to Inter Miami and joining Major League Soccer","url":"https://abcnews.go.com/Sports/wireStory/soccer-world-waits-messis-decision-al-hilal-barcelona-99895224","urlToImage":"https://s.abcnews.com/images/Sports/wirestory_2fef42117e73c5943816f7b079b698c2_16x9_992.jpg","publishedAt":"2023-06-07T19:42:15Z","content":"MIAMI -- Lionel Messi says he is coming to Inter Miami and joining Major League Soccer.\r\nAfter months of speculation, Messi announced his decision Wednesday to join a Miami franchise that has been le… [+2563 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"TIM REYNOLDS AP Sports Writer","title":"Lionel Messi says he's joining Major League Soccer's Inter Miami after exit from Paris Saint-Germain","description":"Lionel Messi says he is coming to Inter Miami and joining Major League Soccer","url":"https://abcnews.go.com/Technology/wireStory/lionel-messi-joining-major-league-soccers-inter-miami-99912431","urlToImage":"https://s.abcnews.com/images/Sports/wirestory_2fef42117e73c5943816f7b079b698c2_16x9_992.jpg","publishedAt":"2023-06-07T20:06:34Z","content":"MIAMI -- Lionel Messi has pulled off his latest stunning feat: He is headed to Major League Soccer, and joining Inter Miami.\r\nAfter months years, even of speculation, Messi finally revealed his decis… [+6221 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"PSG coach confirms Lionel Messi will play final game for club this weekend","description":"PSG coach confirms Lionel Messi will play final game for club this weekend","url":"https://abcnews.go.com/US/wireStory/psg-coach-confirms-lionel-messi-play-final-game-99754335","urlToImage":"https://s.abcnews.com/images/US/abc_news_default_2000x2000_update_16x9_992.jpg","publishedAt":"2023-06-01T12:21:58Z","content":"PSG coach confirms Lionel Messi will play final game for club this weekend"},{"source":{"id":"abc-news","name":"ABC News"},"author":"TIM REYNOLDS AP Sports Writer","title":"Lionel Messi says he's joining Major League Soccer's Inter Miami after exit from Paris Saint-Germain","description":"Lionel Messi says he is coming to Inter Miami and joining Major League Soccer","url":"https://abcnews.go.com/Entertainment/wireStory/lionel-messi-joining-major-league-soccers-inter-miami-99912430","urlToImage":"https://s.abcnews.com/images/Sports/wirestory_2fef42117e73c5943816f7b079b698c2_16x9_992.jpg","publishedAt":"2023-06-07T20:22:15Z","content":"MIAMI -- Lionel Messi has pulled off his latest stunning feat: He is headed to Major League Soccer, and joining Inter Miami.\r\nAfter months years, even of speculation, Messi finally revealed his decis… [+6221 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Saudi Arabian soccer league to get more state funding from policy backed by crown prince MBS","description":"Saudi Arabia has made its ambitious intentions in world soccer even clearer by announcing a “privatization project” for companies to spend more on clubs, as it continues a push to sign some of the world's top players","url":"https://abcnews.go.com/Business/wireStory/saudi-arabian-soccer-league-state-funding-policy-backed-99838929","urlToImage":"https://s.abcnews.com/images/Sports/wirestory_b9b248c3583bff69c9a2206d67caa95c_16x9_992.jpg","publishedAt":"2023-06-05T14:02:17Z","content":"RIYADH, Saudi Arabia -- Cristiano Ronaldo is already in Saudi Arabia. Karim Benzema looks sure to be next. And as the oil-rich kingdom pursues Lionel Messi as well, it is making sure that money conti… [+2072 chars]"}]

class NewsSearchingResponse {
  NewsSearchingResponse({
      this.status, 
      this.totalResults, 
      this.articles,});

  NewsSearchingResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  List<Articles>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "TIM REYNOLDS AP Sports Writer"
/// title : "Lionel Messi says he's joining Major League Soccer's Inter Miami after exit from Paris Saint-Germain"
/// description : "Lionel Messi says he is coming to Inter Miami and joining Major League Soccer"
/// url : "https://abcnews.go.com/Sports/wireStory/soccer-world-waits-messis-decision-al-hilal-barcelona-99895224"
/// urlToImage : "https://s.abcnews.com/images/Sports/wirestory_2fef42117e73c5943816f7b079b698c2_16x9_992.jpg"
/// publishedAt : "2023-06-07T19:42:15Z"
/// content : "MIAMI -- Lionel Messi says he is coming to Inter Miami and joining Major League Soccer.\r\nAfter months of speculation, Messi announced his decision Wednesday to join a Miami franchise that has been le… [+2563 chars]"

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}

/// id : "abc-news"
/// name : "ABC News"

class Source {
  Source({
      this.id, 
      this.name,});

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}