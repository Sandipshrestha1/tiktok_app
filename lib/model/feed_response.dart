// import 'package:tiktok_app/model/feed_model.dart';

// class FeedResponse {
//   final List<FeedModel> feeds;
//   final String error;
//   FeedResponse(this.feeds,this.error);


//   FeedResponse.fromJson[Map<String, dynamic>json]
//   : feeds = (json["videos" ] as List).map((e) => FeedModel.fromJson(e)).toList(),

// FeedResponse.withError(StringerrorValue)
// : feeds = [],
// error =  errorValue;
// }



import 'package:tiktok_app/model/feed_model.dart';

class FeedResponse {
  final List<FeedModel> feeds;
  final String error;
  
  FeedResponse(this.feeds, this.error);

  FeedResponse.fromJson(Map<String, dynamic> json)
      : feeds = (json["videos"] as List).map((e) => FeedModel.fromJson(e)).toList(),
        error = '';

  FeedResponse.withError(String errorValue)
      : feeds = [],
        error = errorValue;
}
