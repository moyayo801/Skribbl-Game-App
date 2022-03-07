import 'package:drawme/models/touch_points.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class MyCustomPainter extends CustomPainter{
MyCustomPainter({required this.pointsList});
List<TouchPoints> pointsList;
List<Offset> offsetPoints = [];

  @override
  void paint(Canvas canvas, Size size) {
Paint backgound = Paint()..color= Colors.white;
Rect rect = Rect.fromLTWH(0, 0, size.width, size.height) ;
canvas.drawRect(rect, backgound);
canvas.clipRect(rect);

for (var i = 0; i < pointsList.length-1; i++) {
  if (pointsList[i] != null && pointsList[i+1] != null ) {
    canvas.drawLine(pointsList[i].points,pointsList[i+1].points , pointsList[i].paint);
  }else if (pointsList[i] != null && pointsList[i+1] == null) {
    offsetPoints.clear();
    offsetPoints.add(pointsList[i].points);
    offsetPoints.add(Offset(pointsList[i].points.dx+0.1, pointsList[i].points.dy+0.1));
    canvas.drawPoints(ui.PointMode.points, offsetPoints, pointsList[i].paint);
  }
}
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}