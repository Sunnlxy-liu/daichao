import 'dart:convert';

import 'package:daichao/model/base_model.dart';

class ArticleDetailModel extends BaseModel {
  final ArticleDetail articleDetail;
  ArticleDetailModel({
    this.articleDetail,
  });

  ArticleDetailModel copyWith({
    ArticleDetail articleDetail,
  }) {
    return ArticleDetailModel(
      articleDetail: articleDetail ?? this.articleDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'articleDetail': articleDetail.toMap(),
    };
  }

  ArticleDetailModel fromMap(Map<String, dynamic> map) {
    return ArticleDetailModel(
      articleDetail: ArticleDetail.fromMap(map['articleDetail']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleDetailModel.fromJson(String source) => ArticleDetailModel().fromMap(json.decode(source));

  @override
  String toString() => 'ArticleDetailModel(articleDetail: $articleDetail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleDetailModel && other.articleDetail == articleDetail;
  }

  @override
  int get hashCode => articleDetail.hashCode;
}

class ArticleDetail {
  final int id;
  final int weigh;
  final int articletypeId;
  final String title;
  final String description;
  final String articlecontent;
  final int createtime;
  final int updatetime;
  final String status;
  final int views;
  final String author;
  final String thumbImage;
  final String thumbImages;
  ArticleDetail({
    this.id,
    this.weigh,
    this.articletypeId,
    this.title,
    this.description,
    this.articlecontent,
    this.createtime,
    this.updatetime,
    this.status,
    this.views,
    this.author,
    this.thumbImage,
    this.thumbImages,
  });

  ArticleDetail copyWith({
    int id,
    int weigh,
    int articletypeId,
    String title,
    String description,
    String articlecontent,
    int createtime,
    int updatetime,
    String status,
    int views,
    String author,
    String thumbImage,
    String thumbImages,
  }) {
    return ArticleDetail(
      id: id ?? this.id,
      weigh: weigh ?? this.weigh,
      articletypeId: articletypeId ?? this.articletypeId,
      title: title ?? this.title,
      description: description ?? this.description,
      articlecontent: articlecontent ?? this.articlecontent,
      createtime: createtime ?? this.createtime,
      updatetime: updatetime ?? this.updatetime,
      status: status ?? this.status,
      views: views ?? this.views,
      author: author ?? this.author,
      thumbImage: thumbImage ?? this.thumbImage,
      thumbImages: thumbImages ?? this.thumbImages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weigh': weigh,
      'articletypeId': articletypeId,
      'title': title,
      'description': description,
      'articlecontent': articlecontent,
      'createtime': createtime,
      'updatetime': updatetime,
      'status': status,
      'views': views,
      'author': author,
      'thumbImage': thumbImage,
      'thumbImages': thumbImages,
    };
  }

  factory ArticleDetail.fromMap(Map<String, dynamic> map) {
    return ArticleDetail(
      id: map['id']?.toInt(),
      weigh: map['weigh']?.toInt(),
      articletypeId: map['articletypeId']?.toInt(),
      title: map['title'],
      description: map['description'],
      articlecontent: map['articlecontent'],
      createtime: map['createtime']?.toInt(),
      updatetime: map['updatetime']?.toInt(),
      status: map['status'],
      views: map['views']?.toInt(),
      author: map['author'],
      thumbImage: map['thumbImage'],
      thumbImages: map['thumbImages'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleDetail.fromJson(String source) => ArticleDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArticleDetail(id: $id, weigh: $weigh, articletypeId: $articletypeId, title: $title, description: $description, articlecontent: $articlecontent, createtime: $createtime, updatetime: $updatetime, status: $status, views: $views,author: $author, thumbImage: $thumbImage, thumbImages: $thumbImages)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleDetail &&
        other.id == id &&
        other.weigh == weigh &&
        other.articletypeId == articletypeId &&
        other.title == title &&
        other.description == description &&
        other.articlecontent == articlecontent &&
        other.createtime == createtime &&
        other.updatetime == updatetime &&
        other.status == status &&
        other.views == views &&
        other.author == author &&
        other.thumbImage == thumbImage &&
        other.thumbImages == thumbImages;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        weigh.hashCode ^
        articletypeId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        articlecontent.hashCode ^
        createtime.hashCode ^
        updatetime.hashCode ^
        status.hashCode ^
        views.hashCode ^
        author.hashCode ^
        thumbImage.hashCode ^
        thumbImages.hashCode;
  }
}
