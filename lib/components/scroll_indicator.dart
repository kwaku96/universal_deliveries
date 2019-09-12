import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {

  final Color color;
  final int pageCount;
  final double scrollPercent;
  final currentIndex;

  ScrollIndicator({
    @required this.color,
    @required this.scrollPercent,
    @required this.pageCount,
    @required this.currentIndex
});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScrollIndicatorPainter(
        color: color,
        scrollPercent: scrollPercent,
        pageCount: pageCount,
        currentIndex: currentIndex
      ),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter{

  final int pageCount;
  final double scrollPercent;
  final int currentIndex;
  final Paint thumbPaint;
  final Paint dotPaint;
  final Color color;

  ScrollIndicatorPainter({
    @required this.pageCount,
    @required this.scrollPercent,
    @required this.color,
    @required this.currentIndex
  }):thumbPaint = Paint()
    ..style = PaintingStyle.fill
    ..color = color,
    dotPaint = Paint()
    ..color = color.withAlpha(150)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width/2,size.height/2) - Offset(60,0);
    Offset thumbPos;
    final radius = 8.0;

    for(int i = 0; i < pageCount ; i++){
      center += Offset(30,0);

      if(currentIndex == i){
        thumbPos = center;
      }

      double thumbLeft = thumbPos.dx - radius;
      double thumbWidth = 2*radius;

      if(scrollPercent*2*radius <= 30){
        thumbWidth += (scrollPercent * 2* radius);
      }else{
        thumbWidth -= ((scrollPercent * 2 * radius) - 30);
        thumbLeft += (2* radius * scrollPercent);
      }


      canvas.drawCircle(center, radius, dotPaint);
      var thumbRect = RRect.fromRectAndCorners(
        Rect.fromLTWH(thumbLeft, thumbPos.dy -radius,thumbWidth, 2*radius),
        topLeft: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      );
      canvas.drawRRect(thumbRect, thumbPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}