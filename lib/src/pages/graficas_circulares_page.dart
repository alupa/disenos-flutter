import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  
  double porcentaje = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100) porcentaje = 0;
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue, icon: Icons.verified_user),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red, icon: Icons.restaurant_menu)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink, icon: Icons.directions_walk),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple, icon: Icons.directions_bus)
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;
  final IconData icon;
   
  const CustomRadialProgress({
    @required this.porcentaje, @required this.color, this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      // color: Colors.redAccent,
      child: RadialProgress(
        porcentaje: porcentaje, 
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 4,
        icon: Icon(icon, color: color, size: 60.0),
        ),
      );
  }
}