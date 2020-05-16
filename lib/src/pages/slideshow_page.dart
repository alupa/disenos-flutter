import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 500;

    final children = [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow())
    ];

    return Scaffold(
      // backgroundColor: Colors.purple,
      body: isLarge ? Column(children: children) : Row(children: children)
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
