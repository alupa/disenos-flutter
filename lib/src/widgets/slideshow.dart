import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
// import 'package:disenos/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({@required this.slides, this.puntosArriba = false, this.colorPrimario = Colors.pink, this.colorSecundario = Colors.grey, this.bulletPrimario = 12.0, this.bulletSecundario = 12.0});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(), //SliderModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
                Provider.of<_SlideshowModel>(context).colorSecundario = this.colorSecundario;
                Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
                Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;
                return _CrearEsctructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
              },
            ),
         ),
      ),
    );
  }
}

class _CrearEsctructuraSlideshow extends StatelessWidget {
  const _CrearEsctructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if(this.puntosArriba)
          _Dots(this.slides.length),// , this.colorPrimario, this.colorSecundario),
        Expanded(child: _Slides(this.slides)),
        if(!this.puntosArriba)
          _Dots(this.slides.length), //, this.colorPrimario, this.colorSecundario),
      ],
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots(this.totalSlides); //, this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (i) => _Dot(i)),//, colorPrimario, colorSecundario)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  
  final int index;
  // final Color colorPrimario;
  // final Color colorSecundario;

  const _Dot(this.index); //, this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;  //<SliderModel>(context).currentPage;
    final ssModel = Provider.of<_SlideshowModel>(context);
    final condicion = (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5);
    
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: condicion ? ssModel.bulletPrimario : ssModel.bulletSecundario,
      height: condicion ? ssModel.bulletPrimario : ssModel.bulletSecundario,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: condicion ? ssModel.colorPrimario : ssModel.colorSecundario,
        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() { 
    super.initState();
    
    pageViewController.addListener((){
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;  //<SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }

  @override
  void dispose() { 
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.pink;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => _currentPage;
  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;
  @protected
  set colorPrimario(Color color) => _colorPrimario = color;

  Color get colorSecundario => _colorSecundario;
  @protected
  set colorSecundario(Color color) => _colorSecundario = color;

  double get bulletPrimario => _bulletPrimario;
  @protected
  set bulletPrimario(double bulletPrimario) => _bulletPrimario = bulletPrimario;

  double get bulletSecundario => _bulletSecundario;
  @protected
  set bulletSecundario(double bulletSecundario) => _bulletSecundario = bulletSecundario;
}