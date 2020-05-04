import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  final Icon icon;

  const RadialProgress({@required this.porcentaje, this.colorPrimario = Colors.blue, this.colorSecundario = Colors.grey, this.grosorPrimario = 10, this.grosorSecundario = 4, this.icon});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() { 
    super.initState();
    
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _MiRadialProgress(
                  (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
                  widget.colorPrimario,
                  widget.colorSecundario,
                  widget.grosorPrimario,
                  widget.grosorSecundario
                  )
                ),
            ),
            // Center(child: Icon(Icons.verified_user, color: widget.colorPrimario, size: 60.0)),
            Center(child: widget.icon),
          ],
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStrokeWidth;
  final double secondaryStrokeWidth;


  _MiRadialProgress(this.percent, this.primaryColor, this.secondaryColor, this.primaryStrokeWidth, this.secondaryStrokeWidth);

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180
    );

    final Gradient gradient = new LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red
      ]
    );

    // Circulo completado
    final paint = new Paint()
      ..strokeWidth = secondaryStrokeWidth
      ..color       = secondaryColor
      ..style       = PaintingStyle.stroke;

    final center = new Offset(size.width * .5, size.height * .5);
    final radius = min(size.width * .5, size.height * .5);

    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = primaryStrokeWidth
      ..color       = primaryColor
      //..shader      = gradient.createShader(rect)
      ..strokeCap   = StrokeCap.round
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