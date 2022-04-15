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
    this.postAuthors,
    this.postCategories,
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
  PostAuthors? postAuthors;
  PostCategories? postCategories;

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
        postAuthors: PostAuthors.fromJson(json["post_authors"]),
        postCategories: PostCategories.fromJson(json["post_categories"]),
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
        "post_authors": postAuthors,
        "post_categories": postCategories,
      };
}

class PostAuthors {
  PostAuthors({
    this.id,
    this.name,
    this.username,
    this.role,
    this.avatar,
    this.email,
    this.provider,
    this.providerId,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;

  String? name;
  String? username;
  String? role;
  String? avatar;
  String? email;

  dynamic provider;
  dynamic providerId;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory PostAuthors.fromJson(Map<String, dynamic> json) => PostAuthors(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        role: json["role"],
        avatar: json["avatar"],
        email: json["email"],
        provider: json["provider"],
        providerId: json["provider_id"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "role": role,
        "avatar": avatar,
        "email": email,
        "provider": provider,
        "provider_id": providerId,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class PostCategories {
  PostCategories({
    this.id,
    this.name,
    this.coverImage,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? coverImage;
  String? status;
  dynamic createdAt;
  dynamic updatedAt;

  factory PostCategories.fromJson(Map<String, dynamic> json) => PostCategories(
        id: json["id"],
        name: json["name"],
        coverImage: json["cover_image"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover_image": coverImage,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
