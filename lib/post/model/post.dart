import 'dart:convert';

class Post {
  Post({
    this.id,
    this.imageUrl,
    this.titleImageUrl,
    this.contentImageUrl,
    this.title,
    this.createdAt,
    this.completed,
    this.deleted,
    this.hasDetail,
  });

  int? id;
  String? imageUrl;
  String? titleImageUrl;
  String? contentImageUrl;
  String? title;
  int? createdAt;
  bool? completed;
  bool? deleted;
  bool? hasDetail;

  Post copyWith({
    int? id,
    String? imageUrl,
    String? titleImageUrl,
    String? contentImageUrl,
    String? title,
    int? createdAt,
    bool? completed,
    bool? deleted,
    bool? hasDetail,
  }) =>
      Post(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        titleImageUrl: titleImageUrl ?? this.titleImageUrl,
        contentImageUrl: contentImageUrl ?? this.contentImageUrl,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        completed: completed ?? this.completed,
        deleted: deleted ?? this.deleted,
        hasDetail: hasDetail ?? this.hasDetail,
      );

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        imageUrl: json["imageUrl"],
        titleImageUrl: json["titleImageUrl"],
        contentImageUrl: json["contentImageUrl"],
        title: json["title"],
        createdAt: json["createdAt"],
        completed: json["completed"],
        deleted: json["deleted"],
        hasDetail: json["hasDetail"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "titleImageUrl": titleImageUrl,
        "contentImageUrl": contentImageUrl,
        "title": title,
        "completed": completed,
        "deleted": deleted,
        "hasDetail": hasDetail,
      };
}
