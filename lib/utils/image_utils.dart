import 'package:flutter/cupertino.dart';
import 'package:image/image.dart';

class ImgUtils {
  static List<int> imgCompress({
    @required data,
  }) {
    List<int> lstRet = data;
    try {
      if (lstRet.length > 1000000) {
        var image = decodeImage(data);

        var thumbnail;

        if (image.width > image.height) {
          thumbnail = copyResize(image, width: image.width > 1024 ? 1024 : image.width);
        } else {
          thumbnail = copyResize(image, width: image.height > 1024 ? 1024 : image.height);
        }

        int nQuality = (1000000 / lstRet.length * 100).toInt();
        // Utils.debugInfo('压缩比: nQuality');
        lstRet = encodeJpg(thumbnail, quality: nQuality);
      }
      // Utils.debugInfo('压缩后大小: ${lstRet.length}');
    } catch (e) {
      // Utils.debugInfo(e.toString());
    }
    return lstRet;
  }
}
