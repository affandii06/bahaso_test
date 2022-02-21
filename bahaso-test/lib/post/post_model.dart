import 'dart:convert';

class PostModel{
  int? userId;
  int? id;
  String? title;
  String? body;
  List<PostModel>? postModel;

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.postModel
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"]
  );

  List<PostModel> postFromJson(String str){
     return postModel = List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
  }

}