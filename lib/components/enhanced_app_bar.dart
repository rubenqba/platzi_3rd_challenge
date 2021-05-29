import 'package:flutter/material.dart';
import 'package:platzi_3rd_challenge/components/simple_app_bar.dart';

class EnhancedAppBar extends StatelessWidget {
  const EnhancedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: SimpleAppBar(),
      clipper: _AppBarWaveClipper(),
    );
  }
}

class _AppBarWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var oneFraction = size.width / 6;

    var firstControlPoint = new Offset(oneFraction, size.height - 35);
    var firstEndPoint = new Offset(oneFraction * 2, size.height - 20);

    var secondControlPoint = new Offset(oneFraction * 3, size.height);
    var secondEndPoint = new Offset(oneFraction * 4, size.height - 20);

    var thirdControlPoint = new Offset(oneFraction * 5, size.height - 35);
    var thirdEndPoint = new Offset(oneFraction * 6, size.height - 30);

    path.lineTo(0.0, size.height - 30);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx,
        firstEndPoint.dy);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx,
        secondEndPoint.dy);

    path.quadraticBezierTo(
        thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx,
        thirdEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}