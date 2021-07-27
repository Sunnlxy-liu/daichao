import 'dart:convert';

import 'package:daichao/model/base_model.dart';

class UploadModel extends BaseModel {
  final String url;
  final String fullurl;
  UploadModel({
    this.url,
    this.fullurl,
  });

  UploadModel copyWith({
    String url,
    String fullurl,
  }) {
    return UploadModel(
      url: url ?? this.url,
      fullurl: fullurl ?? this.fullurl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'fullurl': fullurl,
    };
  }

  UploadModel fromMap(Map<String, dynamic> map) {
    return UploadModel(
      url: map['url'],
      fullurl: map['fullurl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadModel.fromJson(String source) => UploadModel().fromMap(json.decode(source));

  @override
  String toString() => 'UploadModel(url: $url, fullurl: $fullurl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UploadModel && other.url == url && other.fullurl == fullurl;
  }

  @override
  int get hashCode => url.hashCode ^ fullurl.hashCode;
}
