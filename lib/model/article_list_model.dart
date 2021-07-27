import 'dart:convert';

import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class ArticleListModel extends BaseModel {
  final List<ArticleList> articleList;
  ArticleListModel({
    this.articleList,
  });

  ArticleListModel copyWith({
    List<ArticleList> articleList,
  }) {
    return ArticleListModel(
      articleList: articleList ?? this.articleList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'articleList': articleList?.map((x) => x.toMap())?.toList(),
    };
  }

  ArticleListModel fromMap(Map<String, dynamic> map) {
    return ArticleListModel(
      articleList: List<ArticleList>.from(map['articleList']?.map((x) => ArticleList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleListModel.fromJson(String source) => ArticleListModel().fromMap(json.decode(source));

  @override
  String toString() => 'ArticleListModel(articleList: $articleList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleListModel && listEquals(other.articleList, articleList);
  }

  @override
  int get hashCode => articleList.hashCode;
}

class ArticleList {
  final int id;
  final String title;
  final String description;
  final String articlecontent;
  final String thumbImage;
  final int createtime;
  final String status;
  final int views;
  final String name;
  ArticleList({
    this.id,
    this.title,
    this.description,
    this.articlecontent,
    this.thumbImage,
    this.createtime,
    this.status,
    this.views,
    this.name,
  });

  ArticleList copyWith({
    int id,
    String title,
    String description,
    String articlecontent,
    String thumbImage,
    int createtime,
    String status,
    int views,
    String name,
  }) {
    return ArticleList(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      articlecontent: articlecontent ?? this.articlecontent,
      thumbImage: thumbImage ?? this.thumbImage,
      createtime: createtime ?? this.createtime,
      status: status ?? this.status,
      views: views ?? this.views,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'articlecontent': articlecontent,
      'thumbImage': thumbImage,
      'createtime': createtime,
      'status': status,
      'views': views,
      'name': name,
    };
  }

  factory ArticleList.fromMap(Map<String, dynamic> map) {
    return ArticleList(
      id: map['id']?.toInt(),
      title: map['title'],
      description: map['description'],
      articlecontent: map['articlecontent'],
      thumbImage: map['thumbImage'],
      createtime: map['createtime']?.toInt(),
      status: map['status'],
      views: map['views']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleList.fromJson(String source) => ArticleList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArticleList(id: $id, title: $title, description: $description, articlecontent: $articlecontent, thumbImage: $thumbImage, createtime: $createtime, status: $status, views: $views, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleList &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.articlecontent == articlecontent &&
        other.thumbImage == thumbImage &&
        other.createtime == createtime &&
        other.status == status &&
        other.views == views &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        articlecontent.hashCode ^
        thumbImage.hashCode ^
        createtime.hashCode ^
        status.hashCode ^
        views.hashCode ^
        name.hashCode;
  }
}
