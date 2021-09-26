import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  var value;

  BottomWaveClipper({this.value}) : super();

  @override
  Path getClip(Size size) {
    var path = Path();
    // size=ScreenUtil.defaultSize;
    path.lineTo(0.0, size.height/2.h);

    var firstControlPoint = Offset(size.width / 5.w, size.height/2.h - 40.h - value);
    var firstEndPoint = Offset(size.width / 2.w, size.height -180.h);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - size.width /5, size.height + value);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>
      oldClipper is BottomWaveClipper && value != oldClipper.value;
}