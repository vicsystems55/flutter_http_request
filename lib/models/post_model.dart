// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    this.userId,
    this.postCode,
    this.postTitle,
    this.postDescription,
    this.postTags,
    this.postBody,
    this.categoryId,
    this.featuredImage,
    this.views,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? postCode;
  String? postTitle;
  String? postDescription;
  String? postTags;
  String? postBody;
  int? categoryId;
  String? featuredImage;

  String? views;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        userId: json["user_id"],
        postCode: json["post_code"],
        postTitle: json["post_title"],
        postDescription: json["post_description"],
        postTags: json["post_tags"] == null ? null : json["post_tags"],
        postBody: json["post_body"],
        categoryId: json["category_id"],
        featuredImage: json["featured_image"],
        views: json["views"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "post_code": postCode,
        "post_title": postTitle,
        "post_description": postDescription,
        "post_tags": postTags == null ? null : postTags,
        "post_body": postBody,
        "category_id": categoryId,
        "featured_image": featuredImage,
        "views": views,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
