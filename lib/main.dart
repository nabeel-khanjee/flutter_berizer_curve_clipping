import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
          child: new ClipPath(
            child: new Image.network("https://i.imgur.com/rfIxDIX.jpg"),
            clipper: new MyClipper(),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = new Offset(size.width/2.25, size.height-30);
    var firstControlPoint = new Offset(size.width/4, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx ,firstEndPoint.dy);


    var secondControlPoint = new Offset(size.width-(size.width/3.25), size.height-65);
    var secondEndPoint = new Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx ,secondEndPoint.dy);
    
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
