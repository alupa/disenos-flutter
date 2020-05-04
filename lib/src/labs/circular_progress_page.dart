import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  
  double percent = 0.0;
  double newPercent = 0.0;
  AnimationController controller;

  @override
  void initState() { 
    super.initState();
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener((){
      // print('valor controller: ${controller.value}');
      setState(() {
        percent = lerpDouble(percent, newPercent, controller.value);
      });
    });
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          setState(() {
            percent = newPercent;
            newPercent += 10;
            if(newPercent > 100){
              newPercent = 0;
              percent = 0;
            } 
            controller.forward(from: 0.0);
          });
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 250,
          height: 250,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(percent),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final percent;

  _MiRadialProgress(this.percent);


  @override
  void paint(Canvas canvas, Size size) {

    // Circulo completado
    final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final center = new Offset(size.width * .5, size.height * .5);
    final radius = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;
    
    double arcAngle = 2 * pi * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}