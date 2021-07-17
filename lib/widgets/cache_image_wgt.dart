import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheImageWidget extends StatelessWidget {
  /// 图片链接
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit boxFit;
  final String cacheKey;
  final String placeholder;
  final String errorImage;
  final bool showLoading; // showLoading用来标识在图片加载过程中是显示图片占位符还是显示加载中转圈效果
  CacheImageWidget({
    @required this.imageUrl,
    this.width,
    this.height,
    this.cacheKey,
    this.boxFit = BoxFit.contain,
    this.placeholder = "assets/images/default_image.png",
    this.errorImage = "assets/images/default_image.png",
    this.showLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        cacheKey: cacheKey,
        fadeOutDuration: Duration(milliseconds: 0), // 去掉动画效果，否则取缓存图片会闪一下
        fadeInDuration: Duration(milliseconds: 0),
        progressIndicatorBuilder: !showLoading
            ? null
            : (context, url, downloadProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: downloadProgress.progress,
                  ),
                );
              },
        placeholder: showLoading
            ? null
            : (context, url) {
                return Image.asset(
                  placeholder,
                );
              },
        errorWidget: (context, url, error) {
          return Image.asset(
            errorImage,
          );
        },
      ),
    );
  }
}
