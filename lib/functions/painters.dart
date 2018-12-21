import 'package:flutter/material.dart';
import 'dart:math';

class ClockPainter extends CustomPainter{

  final circleRadius;
  final centerPoint;

  ClockPainter({this.centerPoint, this.circleRadius});

  final calculator = Coordinate();

  createPoints(centerDot,circleRadius){


    var theta =[];

    for(var i = 0; i <= 360 ; i = i + 6 ){
      theta.add(i);
    }

    List<Coordinate> points = List<Coordinate>();

      for(var i = 0; i < theta.length; i++){
        Coordinate coordinate = calculator.calculateCoordinate(
            centerX: centerDot.dx,
            centerY: centerDot.dy,
            radius: circleRadius,
            theta: theta[i]
        );
        points.add(coordinate);
      }
      return points;
  }

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint();
    paint.strokeWidth = 1.0;
    paint.color = Colors.white;

    var selectedPaint = Paint();
    selectedPaint.color = Colors.black54;

    final centerDot = centerPoint;

    canvas.drawCircle(centerDot, circleRadius, selectedPaint);
    canvas.drawCircle(centerDot, 10, paint);

    final List<Coordinate> pointsTop = createPoints(centerDot, circleRadius);

    final List<Coordinate> pointsBottom = createPoints(centerDot, circleRadius - 10);

//    Coordinate topHourHand = calculator.calculateCoordinate(
//        centerX: centerDot.dx,
//        centerY: centerDot.dy,
//        radius: circleRadius - 40,
//        theta: 180
//    );
//
//    Coordinate topMinuteHand = calculator.calculateCoordinate(
//        centerX: centerDot.dx,
//        centerY: centerDot.dy,
//        radius: circleRadius - 60,
//        theta: 60
//    );
//
//    canvas.drawLine(Offset(centerDot.dx, centerDot.dy), Offset(topHourHand.dx, topHourHand.dy), paint);
//
//    canvas.drawLine(Offset(centerDot.dx, centerDot.dy), Offset(topMinuteHand.dx, topMinuteHand.dy), paint);

    for(var i = 0;i < pointsBottom.length; i++ )
    {
      var offsetBottom = pointsBottom[i];


      if (i % 5==0) {
        canvas.drawCircle(Offset(offsetBottom.dx, offsetBottom.dy), 6, paint);
      }
      else{
        canvas.drawCircle(Offset(offsetBottom.dx, offsetBottom.dy), 3, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class Coordinate{
  final dx,dy;

  Coordinate({this.dx, this.dy});

  calculateCoordinate({centerX,centerY,radius,theta}){
    final topCoordinateX =centerX + (radius * sin(getRadian(theta)));
    final topCoordinateY =centerY + (radius * cos(getRadian(theta)));
    return Coordinate(dx: topCoordinateX, dy:topCoordinateY);
  }

  getRadian(degree){
    return degree * pi/180;
  }
}

class lineForTime
{
  final Coordinate a, b;

  lineForTime(this.a, this.b);
}


class ClockHandsPainter extends CustomPainter{

  final Offset centerPoint;
  final double radius;
  final int degree;

  ClockHandsPainter( {this.centerPoint, this.radius, this.degree});


  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint();
    paint.strokeWidth = 2.0;
    paint.color = Colors.white;

    var calculator = Coordinate();

    final Coordinate topPointHourHand = calculator.calculateCoordinate(
      centerX: centerPoint.dx,
      centerY: centerPoint.dy,
      radius: radius,
      theta: degree
    );

    canvas.drawLine(
        Offset(centerPoint.dx, centerPoint.dy),
        Offset(topPointHourHand.dx, topPointHourHand.dy),
        paint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}