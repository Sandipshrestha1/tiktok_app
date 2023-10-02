// import 'package:dio/dio.dart';
// import 'package:tiktok_app/model/feed_response.dart';

// class UserRepository {
//   final String apiKey = " Here is your api key";
//   static String mainUrl = "http://api.pexels.com";
//   // ignore: non_constant_identifier_names
//   final Dio_dio = Dio();
//   var getFeedsApi = '$mainUrl/videos/search';

//   Future<FeedResponse> getFeeds() async {

//     // ignore: unused_local_variable
//     var params = {
//       "api_key" : apiKey,
//       "query": "dancing",
//       "size" :"medium",
//       "orientation":"portrait"
//     };

//     try {
//       _dio.interceptors 
//       .add(InterceptorsWrapper(onRequest: (options, handler) async {
// options.handler["Authorization" ] = apiKey;
// _dio.interceptors.requestLock.unlock();
// return handler.next(options);


//       }));

//       Response response = await _dio.get(getFeedsAPI, queryParameters: params);
//       return FeedResponse.fromJson(response.data);



//     } catch (error) {
//       return FeedResponse.withError("$error");
//     }
//   }
// }


import 'package:dio/dio.dart';
import 'package:tiktok_app/model/feed_response.dart';

class UserRepository {
  final String apiKey = "Here is your api key"; // Replace with your actual API key
  static String mainUrl = "http://api.pexels.com";
  final Dio _dio = Dio(); // Corrected variable name

  var getFeedsApi = '$mainUrl/videos/search';

  Future<FeedResponse> getFeeds() async {
    var params = {
      "api_key": apiKey,
      "query": "dancing",
      "size": "medium",
      "orientation": "portrait"
    };

    try {
      _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
        options.headers["Authorization"] = apiKey; // Corrected header assignment
        //_dio.interceptors.requestLock.unlock();
        return handler.next(options);
      }));

      Response response = await _dio.get(getFeedsApi, queryParameters: params); // Corrected variable name
      return FeedResponse.fromJson(response.data);
    } catch (error) {
      return FeedResponse.withError("$error");
    }
  }
}

