// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

class Post {
  Post({
    this.writerUid,
    this.id,
    this.title,
    this.content,
  });

  String? writerUid;
  int? id;
  String? title;
  String? content;

  Post copyWith({
    String? writerUid,
    int? id,
    String? title,
    String? content,
  }) =>
      Post(
        writerUid: writerUid ?? this.writerUid,
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        writerUid: json["writerUid"],
        id: json["id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "writerUid": writerUid,
        "id": id,
        "title": title,
        "content": content,
      };
}
