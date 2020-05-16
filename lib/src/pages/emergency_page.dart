import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:disenos/src/widgets/headers.dart';
import 'package:disenos/src/widgets/boton_gordo.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 500;
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map((item) => FadeInLeft(
      duration: Duration(milliseconds: 500),
      child: BotonGordo(
        icon: item.icon,
        texto: item.texto,
        color1: item.color1,
        color2: item.color2,
        onPress: (){ print('Hola'); },
      ),
    )).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: isLarge ? 200 : 10),
            child: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  if(isLarge)
                    SizedBox(height: 80),
                  ...itemMap
                ],
              ),
            ),
          ),
          if(isLarge)
            IconHeader(
              icon: FontAwesomeIcons.plus,
              titulo: 'Asistencia médica',
              subtitulo: 'Haz solicitado',
              color1: Color(0xff536CF6),
              color2: Color(0xff66A9F2),
            ),
          // Positioned(
          //   right: 0,
          //   top: 30,
          //   child: RawMaterialButton(
          //     onPressed: (){},
          //     shape: CircleBorder(),
          //     padding: EdgeInsets.all(15),
          //     child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)),
          // )
        ],
      )
   );
  }
}

// class BotonGordoTemp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BotonGordo(
//       icon: FontAwesomeIcons.carCrash,
//       texto: 'Motor accident',
//       color1: Color(0xff6989F5),
//       color2: Color(0xff906EF5),
//       onPress: (){print('mi boton gordo funciona de maravilla');},
//     );
//   }
// }

// class PageHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return IconHeader(
//       icon: FontAwesomeIcons.plus,
//       subtitulo: 'Haz solicitado',
//       titulo: 'Asistencia médica',
//       color1: Color(0xff5268F6),
//       color2: Color(0xff67ACF2),
//     );
//   }
// }