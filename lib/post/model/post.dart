import 'dart:convert';

class Post {
  Post({
    this.id,
    this.imageUrl,
    this.titleImageUrl,
    this.contentImageUrl,
    this.bannerImageUrl,
    this.title,
    this.createdAt,
    this.completed,
    this.deleted,
    this.hasDetail,
  });

  String? id;
  String? imageUrl;
  String? titleImageUrl;
  String? contentImageUrl;
  String? bannerImageUrl;
  String? title;
  String? createdAt;
  bool? completed;
  bool? deleted;
  bool? hasDetail;

  Post copyWith({
    String? id,
    String? imageUrl,
    String? titleImageUrl,
    String? contentImageUrl,
    String? bannerImageUrl,
    String? title,
    String? createdAt,
    bool? completed,
    bool? deleted,
    bool? hasDetail,
  }) =>
      Post(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        titleImageUrl: titleImageUrl ?? this.titleImageUrl,
        contentImageUrl: contentImageUrl ?? this.contentImageUrl,
        bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
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
        bannerImageUrl: json["bannerImageUrl"],
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
        "bannerImageUrl": bannerImageUrl,
        "title": title,
        "createdAt": createdAt,
        "completed": completed,
        "deleted": deleted,
        "hasDetail": hasDetail,
      };
}
