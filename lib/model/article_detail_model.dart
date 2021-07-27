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
  final int articletype_id;
  final String title;
  final String description;
  final String articlecontent;
  final int createtime;
  final int updatetime;
  final String status;
  final int views;
  final String thumb_image;
  final String thumb_images;
  ArticleDetail({
    this.id,
    this.weigh,
    this.articletype_id,
    this.title,
    this.description,
    this.articlecontent,
    this.createtime,
    this.updatetime,
    this.status,
    this.views,
    this.thumb_image,
    this.thumb_images,
  });

  ArticleDetail copyWith({
    int id,
    int weigh,
    int articletype_id,
    String title,
    String description,
    String articlecontent,
    int createtime,
    int updatetime,
    String status,
    int views,
    String thumb_image,
    String thumb_images,
  }) {
    return ArticleDetail(
      id: id ?? this.id,
      weigh: weigh ?? this.weigh,
      articletype_id: articletype_id ?? this.articletype_id,
      title: title ?? this.title,
      description: description ?? this.description,
      articlecontent: articlecontent ?? this.articlecontent,
      createtime: createtime ?? this.createtime,
      updatetime: updatetime ?? this.updatetime,
      status: status ?? this.status,
      views: views ?? this.views,
      thumb_image: thumb_image ?? this.thumb_image,
      thumb_images: thumb_images ?? this.thumb_images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weigh': weigh,
      'articletype_id': articletype_id,
      'title': title,
      'description': description,
      'articlecontent': articlecontent,
      'createtime': createtime,
      'updatetime': updatetime,
      'status': status,
      'views': views,
      'thumb_image': thumb_image,
      'thumb_images': thumb_images,
    };
  }

  factory ArticleDetail.fromMap(Map<String, dynamic> map) {
    return ArticleDetail(
      id: map['id']?.toInt(),
      weigh: map['weigh']?.toInt(),
      articletype_id: map['articletype_id']?.toInt(),
      title: map['title'],
      description: map['description'],
      articlecontent: map['articlecontent'],
      createtime: map['createtime']?.toInt(),
      updatetime: map['updatetime']?.toInt(),
      status: map['status'],
      views: map['views']?.toInt(),
      thumb_image: map['thumb_image'],
      thumb_images: map['thumb_images'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleDetail.fromJson(String source) => ArticleDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArticleDetail(id: $id, weigh: $weigh, articletype_id: $articletype_id, title: $title, description: $description, articlecontent: $articlecontent, createtime: $createtime, updatetime: $updatetime, status: $status, views: $views, thumb_image: $thumb_image, thumb_images: $thumb_images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticleDetail &&
        other.id == id &&
        other.weigh == weigh &&
        other.articletype_id == articletype_id &&
        other.title == title &&
        other.description == description &&
        other.articlecontent == articlecontent &&
        other.createtime == createtime &&
        other.updatetime == updatetime &&
        other.status == status &&
        other.views == views &&
        other.thumb_image == thumb_image &&
        other.thumb_images == thumb_images;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        weigh.hashCode ^
        articletype_id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        articlecontent.hashCode ^
        createtime.hashCode ^
        updatetime.hashCode ^
        status.hashCode ^
        views.hashCode ^
        thumb_image.hashCode ^
        thumb_images.hashCode;
  }
}
