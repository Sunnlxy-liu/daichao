
import 'package:flutter/material.dart';

class UndergraphTabIndicator extends Decoration {
 
  const UndergraphTabIndicator({
    this.width,
    this.height,
    this.color
  }) : assert(width != null),
       assert(height != null);

  final double width;

  final double height;

  final Color  color;

  
  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is UndergraphTabIndicator) {
      return UndergraphTabIndicator(
        width: width,
        height: height,
        color: color
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration lerpTo(Decoration b, double t) {
    if (b is UndergraphTabIndicator) {
      return UndergraphTabIndicator(
        width: width,
        height: height,
        color: color
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _UndergraphPainter createBoxPainter([ VoidCallback onChanged ]) {
    return _UndergraphPainter(this, onChanged);
  }
}

class _UndergraphPainter extends BoxPainter {
  _UndergraphPainter(this.decoration, VoidCallback onChanged)
    : assert(decoration != null),
      super(onChanged);

  final UndergraphTabIndicator decoration;

  /*
  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }*/

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    Paint imagePainter = new Paint();
    final Rect rect = offset & configuration.size;

    imagePainter.color = decoration.color;
    imagePainter.style = PaintingStyle.fill;
    final gW = decoration.width;    
    final gH = decoration.height;    //起点    
    Path _path = Path();
    _path.moveTo(offset.dx + (configuration.size.width-gW)/2,  configuration.size.height);    
    _path.lineTo(offset.dx + (configuration.size.width+gW)/2, configuration.size.height);    
    _path.lineTo(offset.dx + (configuration.size.width)/2, configuration.size.height - gH);    
    canvas.drawPath(_path, imagePainter);
    /*final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator = _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.square;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);*/
  }
}
