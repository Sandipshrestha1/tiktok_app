// // import 'package:flutter/material.dart';
// // import 'package:tiktok_app/bloc/feed_bloc.dart';
// // import 'package:tiktok_app/elements/error_elements.dart';
// // import 'package:tiktok_app/elements/loader_element.dart';
// // import 'package:tiktok_app/model/feed_response.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {

// // @override
// // void initState() {

// //   feedBloc.getFeeds();
// //   super.initState();

// // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// // body: StreamBuilder<FeedResponse> (
// //   stream: feedBloc.subject.stream,
// //   builder: (context, AsyncSnapshot snapshot){
// //     if(snapshot.hasData) {

// // if (snapshot.data!.error != ' ' && snapshot.data!.error.isNotEmpty) {
// //   return buildErrorWidget(snapshot.data!.error);
// //   }
// //   return _buildFeedWidget(snapshot.data);
// //     } else if (snapshot.hasError) {

// //       return buildErrorWidget("error");
// //     }
// //     }else {

// //       return buildLoadingWidget();
// //     }
// //   },
// //  ),

// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:tiktok_app/bloc/feed_bloc.dart';
// import 'package:tiktok_app/elements/error_elements.dart';
// import 'package:tiktok_app/elements/loader_element.dart';
// import 'package:tiktok_app/model/feed_model.dart';
// import 'package:tiktok_app/model/feed_response.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     feedBloc.getFeeds();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<FeedResponse>(
//         stream: feedBloc.subject.stream,
//         builder: (context, AsyncSnapshot<FeedResponse> snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data!.error !=  '' && snapshot.data!.error.isNotEmpty) {
//               return buildErrorWidget(snapshot.data!.error);
//             }
//             return _buildFeedWidget(snapshot.data!);
//           } else if (snapshot.hasError) {
//             return buildErrorWidget("An error occurred.");
//           } else {
//             return buildLoadingWidget();
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildFeedWidget(FeedResponse feedData) {

//     List<FeedModel> feeds = data.feeds;
//     return PageView.builder(
// scrollDirection: Axis.vertical,
// itemCount: feeds.length,
// itemBuilder: (context , index) {
//   return SizedBox(height: MediaQuery.of(context).size.height,child: Stack(children:
//   [
//     VideoWidget(
//       url: feeds[index].videos[0].link),],

//     ),);
// }

//     ); // Placeholder container; replace with your feed widget
//   }
// }

import 'package:flutter/material.dart';
import 'package:tiktok_app/bloc/feed_bloc.dart';
import 'package:tiktok_app/elements/error_elements.dart';
import 'package:tiktok_app/elements/loader_element.dart';
import 'package:tiktok_app/model/feed_model.dart';
import 'package:tiktok_app/model/feed_response.dart';
import 'package:tiktok_app/widgets/video_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    feedBloc.getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FeedResponse>(
        stream: feedBloc.subject.stream,
        builder: (context, AsyncSnapshot<FeedResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != '' && snapshot.data!.error.isNotEmpty) {
              return buildErrorWidget(snapshot.data!.error);
            }
            return _buildFeedWidget(snapshot.data!);
          } else if (snapshot.hasError) {
            return buildErrorWidget("An error occurred.");
          } else {
            return buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildFeedWidget(FeedResponse feedData) {
    List<FeedModel> feeds = feedData.feeds; // Use feedData instead of data
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: feeds.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              VideoWidgets(
                url: feeds[index].videos[0].link,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.15)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 0, 0.6, 1]),
                ),
              ),

              Positioned(
                left: 12.0,
                bottom: 32.0,
                child: SafeArea(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1.0, color: Colors.white10),
                            shape: BoxShape.circle,
                            
                            image: DecorationImage(
                              fit : BoxFit.cover,
                              image: NetworkImage(feeds[index].image))
                          ),
                        )
                      ],
                    )
                  ],
                )),
              )
              // Use your VideoWidget here
            ],
          ),
        );
      },
    );
  }
}
