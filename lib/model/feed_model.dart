import 'package:equatable/equatable.dart';

class FeedModel extends Equatable {
  final int id;
  final int width;
  final int height;
  final int duration;
  final String image;
  const FeedModel(this.id, this.width, this.height, this.duration, this.image);

  FeedModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        width = json["width"] ?? 0,
        height = json["height"] ?? 0,
        duration = json["duration"] ?? 0,
        image = json["image"] ?? "";

  @override
  List<Object> get props => [id, width, height, image, duration];

  static const empty = FeedModel(0, 0, 0, 0, "");
}
