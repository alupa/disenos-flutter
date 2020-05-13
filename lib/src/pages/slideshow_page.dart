import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      body: Column(
        children: <Widget>[
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow())
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Slideshow(
      // puntosArriba: true,
      colorPrimario: appTheme.darkTheme ? accentColor : Color(0xffFF5A7E),
      // colorSecundario: Colors.purple,
      bulletPrimario: 15,
      // bulletSecundario: 15,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
