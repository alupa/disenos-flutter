import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
        ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  AnimationController controller;
  //animaciones
  Animation<double> moveToRight; 
  Animation<double> moveToUp; 
  Animation<double> moveToLeft; 
  Animation<double> moveToDown; 
  
  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)
    );

    moveToRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, .25, curve: Curves.bounceOut))
    );

    moveToUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.25, .5, curve: Curves.bounceOut))
    );

    moveToLeft = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.5, .75, curve: Curves.bounceOut))
    );

    moveToDown = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.75, 1, curve: Curves.bounceOut))
    );

    controller.addListener((){
      if( controller.status == AnimationStatus.completed ){
        controller.reset();
      }
    });
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRect) {
        return Transform.translate(
          offset: Offset(moveToRight.value - moveToLeft.value, moveToUp.value - moveToDown.value),
          child: childRect
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}