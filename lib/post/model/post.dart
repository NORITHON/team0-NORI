// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

class Post {
  Post({
    this.imageUrl,
    this.text,
    this.updatedAt,
    this.createdAt,
    this.completed,
    this.deleted,
  });

  String? imageUrl;
  String? text;
  int? updatedAt;
  int? createdAt;
  bool? completed;
  bool? deleted;

  Post copyWith({
    String? imageUrl,
    String? text,
    int? updatedAt,
    int? createdAt,
    bool? completed,
    bool? deleted,
  }) =>
      Post(
        imageUrl: imageUrl ?? this.imageUrl,
        text: text ?? this.text,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        completed: completed ?? this.completed,
        deleted: deleted ?? this.deleted,
      );

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        imageUrl: json["imageUrl"],
        text: json["text"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
        completed: json["completed"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "text": text,
        "updatedAt": updatedAt,
        "createdAt": createdAt,
        "completed": completed,
        "deleted": deleted,
      };
}
