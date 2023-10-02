import 'package:flutter/cupertino.dart';
Widget buildLoadingWidget() {
  return const Center(
    child: Column(
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CupertinoActivityIndicator(),
        ),
      ],
    ),
  );
}
