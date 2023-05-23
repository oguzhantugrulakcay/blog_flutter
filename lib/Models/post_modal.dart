// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Post imgFromJson(String str) => Post.fromJson(json.decode(str));
String imgToJson(Post data) => json.encode(data.toJson());

class Post {
  String Id;
  String Title;
  String Body;
  int LikeCount;
  String IsTask;
  String IsLiked;
  int CommentCount;
  String CreatedAt;
  String PostUser;

  Post(
      {required this.Id,
      required this.Title,
      required this.Body,
      required this.LikeCount,
      this.IsLiked = "false",
      this.IsTask = "false",
      required this.CommentCount,
      required this.CreatedAt,
      required this.PostUser});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      Id: json["Id"],
      Title: json["Title"],
      Body: json["Body"],
      LikeCount: json["LikeCount"],
      IsTask: json["IsTask"],
      CommentCount: json["CommentCount"],
      CreatedAt: json["CreatedAt"],
      IsLiked: json["IsLiked"],
      PostUser: json["PostUser"]);

  Map<String, dynamic> toJson() => {"Title": Title, "Body": Body};
}
