import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';

class PhotoGalleryDialog extends StatefulWidget {
  final List photoList;
  final int index;
  PhotoGalleryDialog({@required this.photoList, this.index = 0});
  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryDialog> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return PhotoView(
              loadingBuilder: (context, progress) {
                return Container(
                  // 加载进度指示器
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.white,
                  ),
                );
              },
              imageProvider: CachedNetworkImageProvider(
                widget.photoList[index],
              ),
            );
          },
          onTap: (index) {
            Navigator.of(context).pop();
          },
          itemCount: widget.photoList.length,
          index: widget.index,
          loop: false,
          pagination: SwiperPagination(
              margin: EdgeInsets.only(bottom: 20),
              builder: DotSwiperPaginationBuilder(
                // 指示器的大小和颜色
                size: 7,
                activeSize: 7,
                color: Colors.grey,
                activeColor: Colors.white,
              )),
        ),
      ),
    );
  }
}
